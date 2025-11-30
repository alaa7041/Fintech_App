import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_bg_layout.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:fintech_app/core/widgets/auth_header.dart';
import 'package:fintech_app/core/widgets/text_divider.dart';
import 'package:fintech_app/feature/auth/login/presentation/screens/face_id_screen.dart';
import 'package:fintech_app/feature/auth/login/presentation/screens/fingrprint_screen.dart';
import 'package:fintech_app/feature/auth/login/presentation/utils/inline_text.dart';
import 'package:fintech_app/feature/auth/register/presentation/register_screen.dart';
import 'package:fintech_app/feature/nav_bar/presentation/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

part '../utils/biometric_login.dart';
part '../utils/login_buttons.dart';
part '../utils/login_form.dart';

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
                title: "Login To Your Account",
                subTitle: "Welcome back you’ve been missed!",
              ),
              Gap(25),
              _LoginForm(),
              Gap(16),
              InlineText(
                title: "Remember me",
                subTitle: "Forget Password?",
                withWidget: true,
              ),
              Gap(30),
              _LoginButtons(),
              Gap(37),
              TextDivider(text: "Or login with"),
              Gap(15),
              _BiometricLogin(),
              Gap(20),
              InlineText(
                title: "Don’t have an account?",
                subTitle: "Sign Up",
                onTap: () => RouteManager.navigateTo(RegisterScreen()),
              ),
              Gap(Utils.bottomDevicePadding)
            ],
          ),
        ),
      ),
    );
  }
}
