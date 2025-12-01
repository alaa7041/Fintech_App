import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/feature/setting/presentation/widgets/body_setting_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
           final colors = Theme.of(context).extension<AppColorsExtension>()!; 
    return Scaffold(
      backgroundColor: colors.bgColor,
      appBar: AppBar(
        backgroundColor: colors.bgColor,
        title: Text('Settings', style: TextStyle(
          fontWeight: FontWeightsHelper.bold,
          fontSize: 24,
          color: colors.primary,
        ),),
      ),
      body: BodySettingScreen(),
    );
  }
}