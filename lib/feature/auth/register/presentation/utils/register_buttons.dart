part of '../register_screen.dart';

class _RegisterButtons extends StatelessWidget {
  const _RegisterButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: "Register",
          onPressed: () => RouteManager.navigateTo(RegisterFingrprintScreen()),
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
              Image.asset(
                Utils.getIconsPNGPath("google"),
                height: 20.height,
                width: 20.width,
              ),
              Gap(4),
              AppText(
                title: "Register with Google",
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
                title: "Register with Apple",
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
