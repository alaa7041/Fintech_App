import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_bg_layout.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/core/widgets/app_success_dialog.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/core/widgets/auth_header.dart';
import 'package:fintech_app/feature/auth/register/presentation/register_face_id_screen.dart';
import 'package:fintech_app/feature/auth/register/presentation/register_set_face_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class RegisterFingrprintScreen extends StatelessWidget {
  const RegisterFingrprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundLayout(
        child: Padding(
          padding: Utils.viewPadding,
          child: Column(
            children: [
              AuthHeader(
                title: "Set Your Finger Print",
                subTitle: "Add a fingerprint to make your account more secure.",
              ),
              Gap(114),
              SvgPicture.asset(
                Utils.getImagesSVGPath("fingrprint"),
                width: 108.width,
                height: 124.height,
              ),
              Gap(117),
              AppText(
                title:
                    "Place your finger in fingerprint sensor until the icon completely",
                style: TextStyle(
                  fontSize: 18.font,
                  fontWeight: FontWeightsHelper.medium,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(60),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: AppButton(
                  text: "Skip",
                  textColor: context.colors.primary,
                  color: Colors.transparent,
                  boxBorder: Border.all(
                    color: context.colors.primary,
                    width: 1.width,
                  ),
                  width: MediaQuery.of(context).size.width / 2.3,
                  onPressed: () {
                    ///TODO delete this dialog place and add it in listener of fingerprint success state
                    AppSuccessDialog.show(
                      context: context,
                      contentText: "You’re verified",
                      subtitle:
                          "You have been verified your information completely. Let’s make transactions!",
                      confirmationText: "Continue",
                      onConfirm: () =>
                          RouteManager.navigateTo(RegisterSetFaceScreen()),
                    );
                  },
                ),
              ),
              Gap(Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
