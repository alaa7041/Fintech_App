part of 'login_cubit.dart';


abstract class BiometricState extends Equatable {
  const BiometricState();

  @override
  List<Object> get props => [];
}

class BiometricInitial extends BiometricState {}
class BiometricLoading extends BiometricState {}
class BiometricSuccess extends BiometricState {}
class BiometricError extends BiometricState {
  final String message;
  const BiometricError(this.message);

  @override
  List<Object> get props => [message];
}
