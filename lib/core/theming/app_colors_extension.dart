import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primary;
  final Color bgColor;
  final Color textColor;
  final Color grey;

  // NEW colors
  final Color btnTextColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color orange;
  final Color cryptoBTC  ;// Lighter purple for Bitcoin
  final Color cryptoETH ; // Bright cyan for Ethereum
  final Color cryptoLTC ; // Lighter coral for Litecoin
  // Profit/Loss colors
  final Color profitGreen ;
  final Color lossRed ;
  // Card background
  final Color cardBackground ;


  const AppColorsExtension({
    required this.primary,
    required this.bgColor,
    required this.textColor,
    required this.grey,
    required this.btnTextColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.orange, required this.cryptoBTC, required this.cryptoETH, required this.cryptoLTC, required this.profitGreen, required this.lossRed, required this.cardBackground,
  });

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? bgColor,
    Color? textColor,
    Color? grey,
    Color? btnTextColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      bgColor: bgColor ?? this.bgColor,
      textColor: textColor ?? this.textColor,
      grey: grey ?? this.grey,
      btnTextColor: btnTextColor ?? this.btnTextColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      orange: orange,
      cryptoBTC: cryptoBTC,
      cryptoETH: cryptoETH,
      cryptoLTC: cryptoLTC,
      profitGreen: profitGreen,
      lossRed: lossRed,
      cardBackground: cardBackground,
   );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      bgColor: Color.lerp(bgColor, other.bgColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      btnTextColor: Color.lerp(btnTextColor, other.btnTextColor, t)!,
      primaryTextColor: Color.lerp(
        primaryTextColor,
        other.primaryTextColor,
        t,
      )!,
      secondaryTextColor: Color.lerp(
        secondaryTextColor,
        other.secondaryTextColor,
        t,
      )!,
      orange: Color.lerp(orange, other.orange, t)!,
      cryptoBTC: Color.lerp(cryptoBTC, other.cryptoBTC, t)!,
      cryptoETH: Color.lerp(cryptoETH, other.cryptoETH, t)!,
      cryptoLTC: Color.lerp(cryptoLTC, other.cryptoLTC, t)!,
      profitGreen: Color.lerp(profitGreen, other.profitGreen, t)!,
      lossRed: Color.lerp(lossRed, other.lossRed, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
    );
  }
}
