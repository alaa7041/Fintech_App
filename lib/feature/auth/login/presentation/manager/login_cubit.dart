import 'dart:io' show Platform;

import 'package:equatable/equatable.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/social_login_utils/social_login_utils.dart';
import 'package:fintech_app/feature/nav_bar/presentation/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(BiometricInitial());

  final _auth = LocalAuthentication();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signInWithApple() async {
    emit(AppleAuthLoading());
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        oauthCredential,
      );

      emit(AppleAuthSuccess(userCredential.user!.uid));
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        emit(AppleAuthFailure("Login canceled by user."));
      } else {
        emit(AppleAuthFailure(e.toString()));
      }
    } catch (e) {
      emit(AppleAuthFailure(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final socialUtils = SocialLoginUtils.instance;

      emit(GoogleLoginLoading());

      final result = await socialUtils.loginWithGoogle();

      if (result == null) {
        emit(GoogleLoginCanceled());
        return;
      }

      emit(GoogleLoginSuccess(result));
      RouteManager.navigateTo(NavBar());
    } catch (e) {
      emit(GoogleLoginCanceled());
    }
  }

  Future<void> loginWithPhonePassword() async {
    emit(LoginLoading());
    if (!formKey.currentState!.validate()) return;

    try {
      final fakeEmail = "${phoneController.text.trim()}@myapp.com";

      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: fakeEmail,
            password: passwordController.text.trim(),
          );

      emit(LoginSuccess());
      RouteManager.navigateTo(NavBar());
      print("✅ Logged in Successfully: ${userCredential.user?.uid}");
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.message ?? "Login failed"));
      print("❌ Login Error: ${e.message}");
    }
  }

  Future<void> authenticateFingerprint() async {
    emit(BiometricLoading());

    try {
      // iOS simulator = Face ID only, redirect to Face ID screen
      if (Platform.isIOS) {
        emit(BiometricError('iOS uses Face ID only. Use Face ID screen.'));
        return;
      }

      final available = await _auth.getAvailableBiometrics();
      print('🔍 Fingerprint available: $available');

      bool hasFingerprint = available.any(
        (type) =>
            type == BiometricType.fingerprint || type == BiometricType.weak,
      );

      if (!hasFingerprint) {
        emit(BiometricError('No fingerprint sensor available'));
        return;
      }

      final authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint',
      );
      _handleAuthResult(authenticated);
    } catch (e) {
      emit(BiometricError('Fingerprint error: $e'));
    }
  }

  Future<void> authenticateFaceID() async {
    emit(BiometricLoading());
    try {
      final available = await _auth.getAvailableBiometrics();
      if (!available.contains(BiometricType.face)) {
        emit(BiometricError('Face ID not available'));
        return;
      }

      final authenticated = await _auth.authenticate(
        localizedReason: 'Scan your face',
      );
      _handleAuthResult(authenticated);
    } catch (e) {
      emit(BiometricError('Face ID error: ${e.toString()}'));
    }
  }

  void _handleAuthResult(bool authenticated) {
    if (authenticated) {
      emit(BiometricSuccess());
    } else {
      emit(BiometricError('Authentication failed'));
    }
  }
}
