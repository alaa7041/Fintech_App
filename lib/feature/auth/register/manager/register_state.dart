class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {

  RegisterError();
}

class RegisterLoading extends RegisterState {}