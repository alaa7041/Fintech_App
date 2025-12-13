part of '../register_screen.dart';

class _RegisterButtons extends StatelessWidget {
  const _RegisterButtons();

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            AppButton(
              text: "Register",
              isLoading: state is RegisterLoading,
              onPressed: () {
                cubit.registerWithPhonePassword();
              },
            ),
          ],
        );
      },
    );
  }
}
