import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/feature/buy_crypto/presentation/screens/buy_crypto_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/global/dimensions.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFAD7DA),
              foregroundColor: Colors.redAccent,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Text(
              'Sell',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.font),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: ElevatedButton(
            onPressed: () => RouteManager.navigateTo(BuyCryptoScreen()),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF163E67),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Text(
              'Buy',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.font),
            ),
          ),
        ),
      ],
    );
  }
}
