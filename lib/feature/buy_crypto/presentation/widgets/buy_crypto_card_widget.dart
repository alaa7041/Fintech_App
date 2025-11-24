import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:fintech_app/feature/buy_crypto/presentation/widgets/buy_crypto_dvider_widget.dart';
import 'package:fintech_app/feature/buy_crypto/presentation/widgets/buy_crypto_option_widget.dart';
import 'package:flutter/material.dart';

class BuyCryptoCardWdiget extends StatelessWidget {
  const BuyCryptoCardWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.radius),
        color: Theme.of(context).extension<AppColorsExtension>()!.btnTextColor,
      ),
      child: Column(
        children: [
          BuyCryptoOptionWidget(
            title: "You pay",
            subTitle: "\$1,800.00",
            moneyType: "USD",
            image: "dollar",
          ),
          const SizedBox(height: 10),
          BuyCryptoDviderWidget(),
          const SizedBox(height: 10),
          BuyCryptoOptionWidget(
            title: "You Receive",
            subTitle: "0.9876",
            moneyType: "ETH",
            image: "eth",
          ),
          SizedBox(height: 40.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 4, backgroundColor: colors.orange),
              const SizedBox(width: 5),
              AppText(
                title: "1 USD = 0.00078 ETH",
                color: colors.grey,
                fontSize: 14,
                fontWeight: FontWeightsHelper.medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
