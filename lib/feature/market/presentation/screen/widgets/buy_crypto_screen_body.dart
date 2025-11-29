import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/feature/market/presentation/screen/widgets/buy_crypto_card_widget.dart';
import 'package:fintech_app/feature/market/presentation/screen/widgets/exchange_widget.dart';
import 'package:fintech_app/feature/payment_method/presentation/screens/payment_method_screen.dart';
import 'package:flutter/material.dart';

class BuyCryptoScreenBody extends StatelessWidget {
  const BuyCryptoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.width,
        vertical: 30.height,
      ),

      child: Column(
        children: [
          BuyCryptoCardWdiget(),
          SizedBox(height: 50.height),
          ExchangeWidget(),
          const SizedBox(height: 4),
          Spacer(),
          AppButton(
            text: "Continue",
            radius: 31.radius,
            height: 50.height,
            onPressed: () {
              RouteManager.navigateTo(
                PaymentMethodScreen(),
                animation: RouteAnimation.fade,
              );
            },
          ),
        ],
      ),
    );
  }
}
