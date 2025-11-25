import 'package:flutter/material.dart';

part 'utils/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         children: [
          //header if needed

          //body form
          _LoginForm()

          //buttons
         ],
      ),
    );
  }
}