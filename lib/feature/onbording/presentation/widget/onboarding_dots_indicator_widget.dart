import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart';

class OnboardingDotsIndicatorWidget extends StatelessWidget {
  const OnboardingDotsIndicatorWidget({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
        final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(4),
          width: currentIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? colors.primary
                : colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}



