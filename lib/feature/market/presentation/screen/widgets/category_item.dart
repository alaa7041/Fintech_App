import 'package:flutter/material.dart';

import '../../../../../core/global/dimensions.dart';
import '../../../../../core/theming/app_colors_extension.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.colors,

    this.isSelected = false,
    required this.category,
  });

  final AppColorsExtension colors;
  final String category;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? colors.primary
            : colors.btnTextColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontSize: 14.font,
            fontWeight: FontWeight.w600,
            color: !isSelected ? colors.primary : colors.btnTextColor,
          ),
        ),
      ),
    );
  }
}

