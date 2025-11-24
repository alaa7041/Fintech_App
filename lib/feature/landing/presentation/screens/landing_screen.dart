import 'package:fintech_app/feature/landing/presentation/widgets/landing_screen_body.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LandingScreenBody()));
  }
}
