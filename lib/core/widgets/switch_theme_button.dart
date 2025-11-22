import 'package:flutter/material.dart';
import 'package:fintech_app/core/theming/theme_notifier.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ValueListenableBuilder(
        valueListenable: ThemeNotifier.themeMode,
        builder: (_, mode, __) {
          return Icon(
            mode == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
          );
        },
      ),
      onPressed: () {
        ThemeNotifier.toggle();
      },
    );
  }
}
