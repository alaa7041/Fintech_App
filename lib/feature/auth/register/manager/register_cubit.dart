import 'package:fintech_app/core/helpers/show_snackbar.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/feature/nav_bar/presentation/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
      
  final formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  Future<void> registerWithPhonePassword() async {
    if (!formKey.currentState!.validate()) {
      autoValidate = true;
      _emit(RegisterInitial());
      return;
    }
    emit(RegisterLoading());

    try {
      final fakeEmail = "${phoneController.text.trim()}@myapp.com";

      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: fakeEmail,
            password: passwordController.text.trim(),
          );

      emit(RegisterSuccess());
      navigateToHome();
    } on FirebaseAuthException catch (e) {
      emit(RegisterError());
      showSnackBar(e.message ?? 'Authentication failed', isError: true);
    }
  }

  void navigateToHome() {
    RouteManager.navigateAndPopAll(NavBar());
  }

  bool get isStateLoading {
    return state is RegisterLoading;
  }

  _emit(RegisterState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
