import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/helpers/validator_utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/widgets/app_bg_layout.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:fintech_app/core/widgets/auth_header.dart';
import 'package:fintech_app/feature/auth/login/presentation/screens/login_screen.dart';
import 'package:fintech_app/feature/auth/login/presentation/utils/inline_text.dart';
import 'package:fintech_app/feature/auth/register/manager/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../nav_bar/presentation/nav_bar.dart';
import '../manager/register_state.dart';

part 'utils/register_buttons.dart';
part 'utils/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  //01550301254
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: AppBackgroundLayout(
          child: SingleChildScrollView(
            padding: Utils.viewPadding,
            child: Column(
              children: [
                AuthHeader(
                  title: "Create Your Account",
                  subTitle: "Sign up to enjoy the best managing experience!",
                ),
                _RegisterForm(),
                Gap(30),
                _RegisterButtons(),
                Gap(20),
                InlineText(
                  title: "Already have an account?",
                  subTitle: "login",
                  onTap: () => RouteManager.navigateTo(LoginScreen()),
                ),
                Gap(Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
