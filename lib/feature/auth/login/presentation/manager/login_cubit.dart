import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fintech_app/core/helpers/shared_prefernce_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<BiometricState> {
  LoginCubit() : super(BiometricInitial());

  final _auth = LocalAuthentication();
  static LoginCubit get(context) => BlocProvider.of(context);

  // Future<void> loginWithBiometrics() async {
  //   emit(BiometricLoading());

  //   bool isEnabled = await SharedPrefHelper.getBiometricsEnabled();
  //   if (!isEnabled) {
  //     emit(BiometricError("Biometric login not enabled"));
  //     return;
  //   }

  //   bool canCheck = await _auth.canCheckBiometrics;
  //   bool isSupported = await _auth.isDeviceSupported();

  //   if (!canCheck || !isSupported) {
  //     emit(BiometricError("Device does not support biometrics"));
  //     return;
  //   }

  //   try {
  //     bool authenticated = await _auth.authenticate(
  //       localizedReason: 'Please authenticate to login',
  //       options: const AuthenticationOptions(
  //         biometricOnly: true,
  //         stickyAuth: true,
  //         useErrorDialogs: true,
  //       ),
  //     );

  //     if (authenticated) {
  //       final user = FirebaseAuth.instance.currentUser;
  //       if (user != null) {
  //         emit(BiometricSuccess());
  //       } else {
  //         emit(BiometricError("Session expired, please login normally"));
  //       }
  //     } else {
  //       emit(BiometricError("Biometric authentication failed"));
  //     }
  //   } catch (e) {
  //     emit(BiometricError("Error: $e"));
  //   }
  // }

}
