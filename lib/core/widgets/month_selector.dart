import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

/// A horizontal month selector widget
class MonthSelector extends StatelessWidget {
  final List<String> months;
  final int selectedIndex;
  final ValueChanged<int> onMonthSelected;

  const MonthSelector({
    super.key,
    required this.months,
    required this.selectedIndex,
    required this.onMonthSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.theme;

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: months.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onMonthSelected(index),
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? colors.primary.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  months[index],
                  style: TextStyle(
                    color: isSelected
                        ? colors.primary
                        : colors.secondaryTextColor,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
