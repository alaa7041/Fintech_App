import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/feature/landing/presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class OnboardingNavigationButtonWidget extends StatelessWidget {
  const OnboardingNavigationButtonWidget({
    super.key,
    required this.currentIndex,
    // required this.fadeAnimation,
    required this.pageController,
  });

  final int currentIndex;
  // final Animation<double> fadeAnimation;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return CircleAvatar(
      backgroundColor: colors.primary,
      child: IconButton(
        icon: Icon(Icons.arrow_forward_ios, color: colors.btnTextColor),
        color: colors.primary,
        onPressed: () {
          currentIndex == 2
              ? RouteManager.navigateTo(
                  LandingScreen(),
                  animation: RouteAnimation.fade,
                )
              : pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
        },
      ),
    );
  }
}
