import 'package:flutter/material.dart';

import '../theming/app_colors_extension.dart';

/// Extension on [BuildContext] to get the [AppColorsExtension].
extension ThemeExtension on BuildContext {
  AppColorsExtension get theme =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
