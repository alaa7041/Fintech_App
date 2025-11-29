import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_success_dialog.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaceIdScreen extends StatelessWidget {
  const FaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Utils.getAssetPNGPath("face_id_bg")),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  AppSuccessDialog.show(
                    context: context,
                    bodyPngImage: Utils.isDarkMode(context)
                        ? "verify_face_dark"
                        : "verify_face",
                    contentText: "You’re verified",
                    subtitle:
                        "You have been verified your information completely. Let’s make transactions!",
                    confirmationText: "Continue To Home",
                  );
                },
                child: SvgPicture.asset(
                  Utils.getImagesSVGPath(
                    Utils.isDarkMode(context)
                        ? "face_id_image_dark"
                        : "face_id_image",
                  ),
                ),
              ),
            ),

            AppText(
              title: "Please wait until your scanning is complete",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.font,
                fontWeight: FontWeightsHelper.medium,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
