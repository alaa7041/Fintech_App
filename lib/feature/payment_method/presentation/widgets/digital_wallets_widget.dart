import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/app_media.dart';

import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class DigitalWalletsWidget extends StatelessWidget {
  const DigitalWalletsWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.height,
          horizontal: 28.width,
        ),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.radius),
          color: colors.btnTextColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              title: title,
              fontSize: 16,
              fontWeight: FontWeightsHelper.semiBold,
              color: colors.primary,
            ),
            Icon(Icons.arrow_forward_ios, color: colors.primary),
          ],
        ),
      ),
    );
  }
}
