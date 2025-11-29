import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/feature/payment_method/presentation/widgets/credit_card_widget.dart';
import 'package:fintech_app/feature/payment_method/presentation/widgets/digital_wallets_widget.dart';
import 'package:fintech_app/feature/payment_method/presentation/widgets/send_receipt_and_switch_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreenBody extends StatelessWidget {
  const PaymentMethodScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.width,
          vertical: 32.height,
        ),
        child: Column(
          children: [
            CreditCardWidget(),
            SizedBox(height: 32.height),
            DigitalWalletsWidget(title: "Google Pay"),
            SizedBox(height: 32.height),
            DigitalWalletsWidget(title: "Mobile Banking"),
            SizedBox(height: 45.height),
            SendReceiptAndSwitchWidget(),
            SizedBox(height: 25.height),
            AppButton(text: "Buy", color: colors.primary, radius: 31.radius),
          ],
        ),
      ),
    );
  }
}
