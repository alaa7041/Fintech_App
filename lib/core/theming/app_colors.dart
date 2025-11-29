import 'package:flutter/material.dart';
import 'app_colors_extension.dart';

extension ColorExt on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
