import 'package:fintech_app/core/helpers/utils.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String image;
  const OnboardingPage({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Center(child: Image.asset(Utils.getAssetPNGPath(image))),
        const SizedBox(height: 40), 
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
