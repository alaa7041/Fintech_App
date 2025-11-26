
import 'package:flutter/material.dart';

import '../../../../../core/global/dimensions.dart';
import '../../../../../core/theming/app_colors_extension.dart';
class StaticsSection extends StatelessWidget {
  const StaticsSection({super.key, required this.stats, required this.colors});

  final Map<String, String> stats;
  final AppColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statics',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.font),
        ),
        const SizedBox(height: 10),
        Column(
          children: stats.entries.map((e) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Text(
                        e.key,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.font,
                          color: colors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.info,
                        size: 14,
                        color: Color(0xFF2B6EA3),
                      ),
                      const Spacer(),
                      Text(
                        e.value,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.font,
                          color: colors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,

                  color: colors.grey.withOpacity(0.4),
                  endIndent: 16,
                  indent: 16,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}