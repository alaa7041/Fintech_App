import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/widgets/app_bg_layout.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/core/widgets/auth_header.dart';
import 'package:fintech_app/feature/auth/register/presentation/register_face_id_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterSetFaceScreen extends StatelessWidget {
  const RegisterSetFaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: AppBackgroundLayout(
        child: Padding(
          padding: Utils.viewPadding,
          child: Column(
            children: [
              AuthHeader(
                title:  "Set Your Face ID",
                subTitle:"Add your face ID to make your account more secure.",
              ),
              Gap(80),
               SvgPicture.asset(
                      Utils.getImagesSVGPath(
                        Utils.isDarkMode(context)
                            ? "face_id_image_dark"
                            : "face_id_image",
                      ),
                    ),
                  
              Gap(180),
              //RegisterFaceIdScreen
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: "Skip",
                      onPressed: () {},

                      textColor: context.colors.primary,
                      color: Colors.transparent,
                      boxBorder: Border.all(
                        color: context.colors.primary,
                        width: 1.width,
                      ),
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: AppButton(
                      text: "Continue",
                      onPressed: () =>
                          RouteManager.navigateTo(RegisterFaceIdScreen()),
                    ),
                  ),
                ],
              ),
              Gap(Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
