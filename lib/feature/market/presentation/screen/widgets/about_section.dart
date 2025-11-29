import 'package:flutter/material.dart';

import '../../../../../core/global/dimensions.dart';
import '../../../../../core/theming/app_colors_extension.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.colors});

  final AppColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Bitcoin',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Bitcoin is a decentralized cryptocurrency originally described in a 2008 whitepaper by a person, or group of people, using the alias Satoshi Nakamoto. It was launched soon after, in January 2009.',
          style: TextStyle(color: colors.grey, fontSize: 16.font),
        ),
      ],
    );
  }
}