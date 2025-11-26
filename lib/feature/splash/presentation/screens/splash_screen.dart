import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/feature/splash/presentation/screens/widgets/splash_body_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return Scaffold(
      backgroundColor: colors.btnTextColor,
      body: SplashBodyWidget(),
    );
  }
}
