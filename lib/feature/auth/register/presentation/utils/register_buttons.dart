part of '../register_screen.dart';

class _RegisterButtons extends StatelessWidget {
  const _RegisterButtons();

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);
    return BlocConsumer(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterSuccess) {
          RouteManager.navigateTo(NavBar());
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AppButton(
              text: "Register",
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
