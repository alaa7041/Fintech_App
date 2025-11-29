import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_bg_layout.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class FingrprintScreen extends StatelessWidget {
  const FingrprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundLayout(
        child: Padding(
          padding: Utils.viewPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(90),
              AppText(
                title: "Touch ID sensor to verify yourself",
                style: TextStyle(
                  fontSize: 26.font,
                  fontWeight: FontWeightsHelper.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(130),
              SvgPicture.asset(
                Utils.getImagesSVGPath("fingrprint"),
                height: 124.height,
                width: 124.width,
              ),
              Gap(210),
              AppText(
                title:
                    "Please verify your identity using touch ID and it will proceed automatically.",
                style: TextStyle(
                  fontSize: 18.font,
                  fontWeight: FontWeightsHelper.regular,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
///TODO use this success dialog 
    // AppSuccessDialog.show(
    //                 context: context,
    //                 contentText: "You’re verified",
    //                 subtitle:
    //                     "You have been verified your information completely. Let’s make transactions!",
    //                 confirmationText: "Continue To Home",
    //               )
