
import 'package:fintech_app/core/widgets/custom_app_bar.dart';
import 'package:fintech_app/feature/market/presentation/screen/widgets/buy_crypto_screen_body.dart';
import 'package:flutter/material.dart';

class BuyCryptoScreen extends StatelessWidget {
  const BuyCryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Buy Crypto",
      
      ), 
      body: BuyCryptoScreenBody(),
    );
  }
}
