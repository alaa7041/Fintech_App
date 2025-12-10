import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

Future<void> registerWithPhonePassword() async {
  emit(RegisterLoading());
  if (!formKey.currentState!.validate()) return;

  try {
    final fakeEmail = "${phoneController.text.trim()}@myapp.com";

    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: fakeEmail,
      password: passwordController.text.trim(),
    );

    emit(RegisterSuccess());
    
    print("✅ Registered Successfully: ${userCredential.user?.uid}");
  } on FirebaseAuthException catch (e) {
    emit(RegisterError(e.message ?? "Register failed"));
    print("❌ Register Error: ${e.message}");
  }
}


}
