
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SendReceiptAndSwitchWidget extends StatelessWidget {
  const SendReceiptAndSwitchWidget({
    super.key, 
  }); 

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title: "Send receipt to your email",
          fontSize: 12,
          fontWeight: FontWeightsHelper.medium,
          color: colors.primary,
        ),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            value: true,
            onChanged: (value) {},
            activeThumbColor: Colors.white,
            inactiveTrackColor: colors.grey,
            inactiveThumbColor: Colors.white,
            activeTrackColor: colors.primary,
          ),
        ),
      ],
    );
  }
}
