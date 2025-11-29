import 'package:fintech_app/core/widgets/custom_app_bar.dart';
import 'package:fintech_app/feature/payment_method/presentation/widgets/payment_method_screen_body.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Method', withArrow: true),
      body: PaymentMethodScreenBody(),
    );
  }
}
