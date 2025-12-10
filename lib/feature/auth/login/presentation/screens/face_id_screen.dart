import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_success_dialog.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/feature/auth/login/presentation/manager/login_cubit.dart';
import 'package:fintech_app/feature/nav_bar/presentation/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaceIdScreen extends StatelessWidget {
  const FaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Utils.getAssetPNGPath("face_id_bg")),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<LoginCubit, LoginState>(
            
            builder: (context, state) {
              final cubit = LoginCubit.get(context);
              return Column(
                children: [
                  Spacer(),
                  Expanded(
                    child: GestureDetector(
                      onTap: state is! BiometricLoading
                          ? () => cubit.authenticateFaceID(context)
                          : null,
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
              );
            },
          ),
        ),
      ),
    );
  }
}

///TODO: Add success dialog
//AppSuccessDialog.show(
                  //   context: context,
                  //   bodyPngImage: Utils.isDarkMode(context)
                  //       ? "verify_face_dark"
                  //       : "verify_face",
                  //   contentText: "You’re verified",
                  //   subtitle:
                  //       "You have been verified your information completely. Let’s make transactions!",
                  //   confirmationText: "Continue To Home",
                  // );