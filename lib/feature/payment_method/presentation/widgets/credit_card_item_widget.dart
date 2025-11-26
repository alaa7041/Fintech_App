import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart'; 

class CreditCardItemWidget extends StatelessWidget {
  const CreditCardItemWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Container(
      height: 40.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.radius),
        color: colors.primary,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.width,
          vertical: 11.height,
        ),
        child: Image.asset(Utils.getAssetPNGPath(image)),
      ),
    );
  }
}
