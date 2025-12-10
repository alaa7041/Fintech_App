import 'package:equatable/equatable.dart';
import 'package:fintech_app/core/helpers/show_snackbar.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/social_login_utils/social_login_utils.dart';
import 'package:fintech_app/feature/nav_bar/presentation/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../core/widgets/app_success_dialog.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _auth = LocalAuthentication();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  Future<void> signInWithApple() async {
    _emit(AppleAuthLoading());
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

      _emit(AppleAuthSuccess(userCredential.user!.uid));
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        _emit(AppleAuthFailure());
        showSnackBar("Login canceled by user", isError: true);
      } else {
        _emit(AppleAuthFailure());
        showSnackBar("Login canceled by user", isError: true);
      }
    } catch (e) {
      _emit(AppleAuthFailure());
      showSnackBar("Login canceled by user", isError: true);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final socialUtils = SocialLoginUtils.instance;

      _emit(GoogleLoginLoading());

      final result = await socialUtils.loginWithGoogle();

      if (result == null) {
        _emit(GoogleLoginCanceled());
        return;
      }

      _emit(GoogleLoginSuccess(result));
      navigateToHome();
    } catch (e) {
      _emit(GoogleLoginCanceled());
    }
  }

  Future<void> loginWithPhonePassword() async {
    if (!formKey.currentState!.validate()) {
      autoValidate = true;
      _emit(LoginInitial());
      return;
    }
    _emit(LoginLoading());

    try {
      final fakeEmail = "${phoneController.text.trim()}@myapp.com";

      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: fakeEmail,
            password: passwordController.text.trim(),
          );

      _emit(LoginSuccess());

      navigateToHome();
    } on FirebaseAuthException catch (e) {
      _emit(LoginError());
      showSnackBar(e.message ?? "Login failed", isError: true);
    }
  }

  Future<void> authenticateFingerprint(BuildContext context) async {
    _emit(BiometricLoading());
    try {
      final available = await _auth.getAvailableBiometrics();

      bool hasFingerprint = available.any(
        (type) =>
            type == BiometricType.fingerprint || type == BiometricType.weak,
      );

      if (!hasFingerprint) {
        _emit(BiometricError());
        showSnackBar('No fingerprint sensor available', isError: true);
        return;
      }

      final authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint',
      );
      _handleAuthResult(authenticated, context);
    } catch (e) {
      _emit(BiometricError());
      showSnackBar(e.toString(), isError: true);
    }
  }

  Future<void> authenticateFaceID(BuildContext context) async {
    _emit(BiometricLoading());
    try {
      final available = await _auth.getAvailableBiometrics();
      if (!available.contains(BiometricType.face)) {
        _emit(BiometricError());
        showSnackBar('Face ID not available', isError: true);

        return;
      }

      final authenticated = await _auth.authenticate(
        localizedReason: 'Scan your face',
      );
      _handleAuthResult(authenticated, context);
    } catch (e) {
      _emit(BiometricError());
      showSnackBar(e.toString(), isError: true);
    }
  }

  void _handleAuthResult(bool authenticated, BuildContext context) {
    if (authenticated) {
      _emit(BiometricSuccess());
      AppSuccessDialog.show(
        context: context,
        contentText: "You're verified",
        subtitle:
            "You have been verified your information completely. Let's make transactions!",
        confirmationText: "Continue To Home",
        onConfirm: () => navigateToHome(),
      );
    } else {
      _emit(BiometricError());
      showSnackBar('Authentication failed', isError: true);
    }
  }

  void navigateToHome() {
    RouteManager.navigateAndPopAll(NavBar());
  }

  bool get isStateLoading {
    return state is LoginLoading;
  }

  bool get isGoogleLoading {
    return state is GoogleLoginLoading;
  }

  bool get isAppleLoading {
    return state is AppleAuthLoading;
  }

  _emit(LoginState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
