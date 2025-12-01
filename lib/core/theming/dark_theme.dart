import 'package:fintech_app/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'app_colors_extension.dart';

class AppDarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Lato',
    scaffoldBackgroundColor: DarkColors.bgColor,

    extensions: [
      AppColorsExtension(
        naviconColor: DarkColors.navIconColor,
        primary: DarkColors.primary,
        bgColor: DarkColors.bgColor,
        textColor: DarkColors.textColor,
        grey: DarkColors.grey,
        btnTextColor: DarkColors.btnTextColor,
        primaryTextColor: DarkColors.primaryTextColor,
        secondaryTextColor: DarkColors.secondaryTextColor,
        orange: DarkColors.orange,
        cryptoBTC: DarkColors.cryptoBTC,
        cryptoETH: DarkColors.cryptoETH,
        cryptoLTC: DarkColors.cryptoLTC,
        profitGreen: DarkColors.profitGreen,
        lossRed: DarkColors.lossRed,
        cardBackground: DarkColors.cardBackground,
      ),
    ],
  );
}
