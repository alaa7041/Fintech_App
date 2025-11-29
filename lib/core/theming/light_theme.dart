import 'package:fintech_app/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'app_colors_extension.dart';

class AppLightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Lato',
    scaffoldBackgroundColor: LightColors.bgColor,

    extensions: [
  AppColorsExtension(
    primary: LightColors.primary,
    bgColor: LightColors.bgColor,
    textColor: LightColors.textColor,
    grey: LightColors.grey,
    btnTextColor: LightColors.btnTextColor,
    primaryTextColor: LightColors.primaryTextColor,
    secondaryTextColor: LightColors.secondaryTextColor,
    orange: LightColors.orange,
    cryptoBTC:LightColors.cryptoBTC,
    cryptoETH: LightColors.cryptoETH,
    cryptoLTC: LightColors.cryptoLTC,
    profitGreen: LightColors.profitGreen,
    lossRed: LightColors.lossRed,
    cardBackground: LightColors.cardBackground,
  ),
]

  );
}
