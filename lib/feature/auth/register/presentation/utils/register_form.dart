part of '../register_screen.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Name",
            keyboardType: TextInputType.name,
            validator: (value) => ValidatorUtils.validateName(value),
            controller: cubit.nameController,
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
            hintText: "Phone",
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
          Gap(16),
          AppTextFormField(
            hintText: "Confirm Password",
            keyboardType: TextInputType.visiblePassword,
            controller: cubit.confirmPasswordController,
            validator: (value) => ValidatorUtils.validatePasswordConfirm(
              value,
              cubit.passwordController.text,
            ),
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
