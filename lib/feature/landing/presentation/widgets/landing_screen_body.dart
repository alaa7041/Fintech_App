import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LandingScreenBody extends StatelessWidget {
  const LandingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 50.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(Utils.getAssetPNGPath('onboarding4'))),
          SizedBox(height: 60.height),
          AppText(
            title: "Get Started Now!",
            fontSize: 30,
            fontWeight: FontWeightsHelper.bold,
          ),
          SizedBox(height: 60.height),
          AppButton(text: "Login", radius: 31.radius, onPressed: () {}),
          SizedBox(height: 18.height),
          AppButton(
            text: "Register",
            radius: 31.radius,
            onPressed: () {},
            color: colors.btnTextColor,
            textColor: colors.primary,
            boxBorder: Border.all(color: colors.primary, width: 2),
          ),
        ],
      ),
    );
  }
}
