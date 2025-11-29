import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? subTitle;
  const AuthHeader({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.width,
      vertical: 55.height
      ),
      child: Column(
        children: [
          AppText(
            title: title,
            style: TextStyle(
              fontSize: 26.font,
              fontWeight: FontWeightsHelper.bold,
              overflow: TextOverflow.visible,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(15),
          AppText(
            title: subTitle??"",
            style: TextStyle(
              fontSize: 18.font,
              fontWeight: FontWeightsHelper.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
