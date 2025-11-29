import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/widgets/app_bg_layout.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:fintech_app/core/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

part 'utils/login_form.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundLayout(
        child: SingleChildScrollView(
          padding: Utils.viewPadding,
          child: Column(
            children: [
              AuthHeader(
                title:  "Login To Your Account",
                subTitle: "Welcome back you’ve been missed!",
              ),
              _LoginForm(),

              //

            ],
          ),
        ),
      ),
    );
  }
}
