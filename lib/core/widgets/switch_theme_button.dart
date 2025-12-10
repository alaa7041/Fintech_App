import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/theming/theme_notifier.dart';
import 'package:flutter/material.dart';

class SwitchThemeToggle extends StatelessWidget {
  const SwitchThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeNotifier.themeMode,
      builder: (_, mode, __) {
        final isDark = mode == ThemeMode.dark;

        return Switch(
          activeThumbColor: context.colors.primary,
          activeTrackColor: context.colors.naviconColor,
          inactiveThumbColor: context.colors.grey,
          inactiveTrackColor: context.colors.bgColor,
          value: isDark,
          onChanged: (value) {
            ThemeNotifier.toggle();
          },
        );
      },
    );
  }
}
