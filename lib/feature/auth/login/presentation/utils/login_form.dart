part of '../screens/login_screen.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "xxx xxx xxxx",
            controller: cubit.phoneController,
            validator: (value) => ValidatorUtils.validateEGPhoneNumber(value),

            keyboardType: TextInputType.phone,
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Icon(Icons.phone_outlined, color: context.colors.primary),
            ),
          ),
          Gap(16),
          AppTextFormField(
            hintText: "Password",
            controller: cubit.passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => ValidatorUtils.validatePassword(value),
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
