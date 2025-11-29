part of '../register_screen.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppTextFormField(
            hintText: "First Name",
            keyboardType: TextInputType.name,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(
                Icons.person_3_outlined,
                color: context.colors.primary,
              ),
            ),
          ),
          Gap(16),

          AppTextFormField(
            hintText: "Last Name",
            keyboardType: TextInputType.name,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(
                Icons.person_3_outlined,
                color: context.colors.primary,
              ),
            ),
          ),
          Gap(16),

          AppTextFormField(
            hintText: "E-mail ID",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(Icons.email_outlined, color: context.colors.primary),
            ),
          ),
          Gap(16),
          AppTextFormField(
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            isObscureText: true,
            isPassword: true,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(Icons.lock_outline, color: context.colors.primary),
            ),
          ),
          Gap(16),
          AppTextFormField(
            hintText: "Confirm Password",
            keyboardType: TextInputType.visiblePassword,
            isObscureText: true,
            isPassword: true,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(Icons.lock_outline, color: context.colors.primary),
            ),
          ),
          Gap(16),

          AppTextFormField(
            hintText: "xxx xxx xxxx",
            keyboardType: TextInputType.phone,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(Icons.phone_outlined, color: context.colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
