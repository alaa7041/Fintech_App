part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {

  const LoginError();
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class BiometricLoading extends LoginState {}

class BiometricSuccess extends LoginState {}

class BiometricError extends LoginState {
  const BiometricError();
}

class GoogleLoginSuccess extends LoginState {
  final UserCredential user;
  const GoogleLoginSuccess(this.user);
}

class GoogleLoginLoading extends LoginState {
  const GoogleLoginLoading();
}

class GoogleLoginCanceled extends LoginState {
  const GoogleLoginCanceled();
}

class AppleAuthSuccess extends LoginState {
  final String uid;
  const AppleAuthSuccess(this.uid);
}

class AppleAuthLoading extends LoginState {}

class AppleAuthFailure extends LoginState {


  const AppleAuthFailure();
}
