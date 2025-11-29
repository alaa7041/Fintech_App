import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/app_media.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/feature/payment_method/presentation/widgets/credit_card_item_widget.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.radius),
        color: colors.btnTextColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: "Credit Card",
                fontSize: 16,
                fontWeight: FontWeightsHelper.bold,
              ),
              Icon(Icons.arrow_drop_up_outlined, color: colors.primary),
            ],
          ),
          SizedBox(height: 24.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CreditCardItemWidget(image: 'visa'),
              CreditCardItemWidget(image: 'master'),
              CreditCardItemWidget(image: 'pay'),
            ],
          ),
          SizedBox(height: 24.height),
          Image.asset(Utils.getAssetPNGPath('card')),
        ],
      ),
    );
  }
}
