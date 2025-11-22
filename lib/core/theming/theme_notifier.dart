import 'package:flutter/material.dart';

class ThemeNotifier {
  static ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

  static void toggle() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
