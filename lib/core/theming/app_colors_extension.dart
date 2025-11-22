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

  const AppColorsExtension({
    required this.primary,
    required this.bgColor,
    required this.textColor,
    required this.grey,
    required this.btnTextColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
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
    );
  }

  @override
  AppColorsExtension lerp(
      ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      bgColor: Color.lerp(bgColor, other.bgColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      btnTextColor: Color.lerp(btnTextColor, other.btnTextColor, t)!,
      primaryTextColor:
          Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
    );
  }
}
