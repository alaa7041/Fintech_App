import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterFaceIdScreen extends StatelessWidget {
  const RegisterFaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: delete this flag and depand on the state managment
    final bool successState = false;

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
        child: Padding(
          padding: Utils.viewPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppText(
                title: successState == true
                    ? "You’re Ready!"
                    : "Place your face ID in face scanner until the icon completely",
                style: TextStyle(
                  fontSize: 18.font,
                  fontWeight: FontWeightsHelper.medium,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              successState == true
                  ? Expanded(
                      child: SvgPicture.asset(
                        Utils.getImagesSVGPath(
                          Utils.isDarkMode(context)
                              ? "verify_face_dark"
                              : "verify_face",
                        ),
                      ),
                    )
                  : Expanded(
                      child: SvgPicture.asset(
                        Utils.getImagesSVGPath(
                          Utils.isDarkMode(context)
                              ? "face_id_image_dark"
                              : "face_id_image",
                        ),
                      ),
                    ),

              Spacer(),
              successState == true
                  ? AppButton(
                      text: 'Continue',
                      color: Colors.white,
                      textColor: context.colors.primary,
                    )
                  : AppText(
                      title:
                          "Once your scanning is complete, you will be able to sign in by using face ID",
                      style: TextStyle(
                        fontSize: 18.font,
                        fontWeight: FontWeightsHelper.medium,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
