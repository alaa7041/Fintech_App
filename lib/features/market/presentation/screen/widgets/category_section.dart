import 'package:flutter/material.dart';

import '../../../../../core/global/dimensions.dart';
import '../../../../../core/theming/app_colors_extension.dart';
import 'category_item.dart';

class CatergorySection extends StatelessWidget {
  const CatergorySection({
    super.key,
    required this.colors,
    required this.categories,
  });

  final AppColorsExtension colors;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
        CategoryItem(
          colors: colors,
          category: categories[0],
          isSelected: true,
        ),

        CategoryItem(
          colors: colors,
          category: categories[1],
        ),

        CategoryItem(
          colors: colors,
          category: categories[2],
        ),

        CategoryItem(
          colors: colors,
          category: categories[3],
        ),

        CategoryItem(
          colors: colors,
          category: categories[4],
        ),
      ],
    );
  }
}
