part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class BiometricInitial extends LoginState {}

class BiometricLoading extends LoginState {}

class BiometricSuccess extends LoginState {}

class BiometricError extends LoginState {
  final String message;
  const BiometricError(this.message);

  @override
  List<Object> get props => [message];
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

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
}
class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}
class AppleAuthSuccess extends LoginState {
  final String uid;

  const AppleAuthSuccess(this.uid);
}
class AppleAuthLoading extends LoginState {}

class AppleAuthFailure extends LoginState {
  final String error;

  const AppleAuthFailure(this.error);
}