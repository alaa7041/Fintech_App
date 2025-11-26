import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/feature/onbording/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashBodyWidget extends StatefulWidget {
  const SplashBodyWidget({super.key});

  @override
  State<SplashBodyWidget> createState() => _SplashBodyWidgetState();
}

class _SplashBodyWidgetState extends State<SplashBodyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size.height * 0.15,
              bottom: size.height * 0.15,
              child: Container(
                width: size.width * 2,
                height: size.width * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffedeeef),
                ),
              ),
            ),
            Container(
              width: size.width * 0.9,
              height: size.width * 0.9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffdddfe1),
              ),
            ),
            FadeTransition(
              opacity: fadeAnimation,
              child: SvgPicture.asset(
                Utils.getImagesSVGPath('logo'),
                width: 140,
                height: 140,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initFadeAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      RouteManager.navigateTo(
        OnboardingScreen(),
        animation: RouteAnimation.fade,
      );
    });
  }
}
