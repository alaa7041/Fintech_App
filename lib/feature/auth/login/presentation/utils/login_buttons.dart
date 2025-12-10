part of '../screens/login_screen.dart';

class _LoginButtons extends StatelessWidget {
  const _LoginButtons();

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.get(context);
    return BlocConsumer(
      bloc: cubit,
      listener: (context, state) {
        if (state is GoogleLoginSuccess ||
            state is LoginSuccess ||
            state is AppleAuthSuccess) {
          RouteManager.navigateTo(NavBar());
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AppButton(
              text: "Login",
              isLoading: state is LoginLoading,
              onPressed: () => cubit.loginWithPhonePassword(),
            ),
            Gap(10),
            AppButton(
              text: "",
              isLoading: state is GoogleLoginLoading,
              loaderColor: context.colors.primary,
              onPressed: () => cubit.loginWithGoogle(),
              color: Colors.transparent,

              boxBorder: Border.all(
                color: context.colors.primary,
                width: 1.width,
              ),

              widget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Utils.getIconsPNGPath("google"),
                    height: 20.height,
                    width: 20.width,
                  ),
                  Gap(4),
                  AppText(
                    title: "Login with Google",
                    style: TextStyle(
                      color: context.colors.primary,
                      fontSize: 18.font,
                      fontWeight: FontWeightsHelper.bold,
                    ),
                  ),
                ],
              ),
            ),

            if (Platform.isIOS) ...[
              Gap(10),
              AppButton(
                isLoading: state is AppleAuthLoading,
                text: "",
                loaderColor: context.colors.primary,
                onPressed: () {
                  cubit.signInWithApple();
                },
                color: Colors.transparent,
                boxBorder: Border.all(
                  color: context.colors.primary,
                  width: 1.width,
                ),

                widget: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apple,
                      color: context.colors.primary,
                      size: 30.font,
                    ),
                    Gap(3),
                    AppText(
                      title: "Login with Apple",
                      style: TextStyle(
                        color: context.colors.primary,
                        fontSize: 18.font,
                        fontWeight: FontWeightsHelper.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
