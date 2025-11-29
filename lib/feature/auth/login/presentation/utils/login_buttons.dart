part of '../login_screen.dart';

class _LoginButtons extends StatelessWidget {
  const _LoginButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(text: "Login", onPressed: () {}),
        Gap(10),
        AppButton(
          text: "",
          onPressed: () {},
          color: Colors.transparent,
          boxBorder: Border.all(color: context.colors.primary, width: 1.width),

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
        Gap(10),

        AppButton(
          text: "",
          onPressed: () {},
          color: Colors.transparent,
          boxBorder: Border.all(color: context.colors.primary, width: 1.width),

          widget: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.apple, color: context.colors.primary, size: 30.font),
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
    );
  }
}
