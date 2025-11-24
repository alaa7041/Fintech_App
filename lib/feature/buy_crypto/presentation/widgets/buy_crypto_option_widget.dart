import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BuyCryptoOptionWidget extends StatelessWidget {
  const BuyCryptoOptionWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.moneyType,
    required this.icon,
  });

  final String title, subTitle, moneyType;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<AppColorsExtension>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: title,
              fontSize: 12,
              color: color.grey,
              fontWeight: FontWeightsHelper.medium,
            ),
            SizedBox(height: 5.height),
            AppText(
              title: subTitle,
              fontSize: 20,
              color: color.primary,
              fontWeight: FontWeightsHelper.bold,
            ),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: color.bgColor,
              child: Center(child: Icon(icon, color: color.primary)),
            ),

            SizedBox(width: 5.width),
            AppText(
              title: moneyType,
              fontSize: 16,
              color: color.primary,
              fontWeight: FontWeightsHelper.bold,
            ),
            SizedBox(width: 5.width),
            Icon(Icons.arrow_drop_down, color: color.grey),
          ],
        ),
      ],
    );
  }
}
