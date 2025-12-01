import 'package:flutter/material.dart';

import 'switch_theme_button.dart';

/// Demo screen to showcase screen with theme switcher
class ThemeScreenDemo extends StatelessWidget {
  const ThemeScreenDemo(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(top: 40, right: 16, child: SwitchThemeToggle()),
      ],
    );
  }
}
