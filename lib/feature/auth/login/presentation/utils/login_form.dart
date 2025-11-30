part of '../screens/login_screen.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppTextFormField(
            hintText: "E-mail ID",
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(Icons.email_outlined, color: context.colors.primary),
            ),
          ),
          Gap(16),
          AppTextFormField(
            hintText: "Password",
            isObscureText: true,
            isPassword: true,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(Icons.lock_outline, color: context.colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
