import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  final double lineThickness;

  const TextDivider({super.key, required this.text, this.lineThickness = .5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.colors.grey,
            thickness: lineThickness,
            endIndent: 30,
            indent: 10,
          ),
        ),
        AppText(
          title: text,
          style: TextStyle(color: context.colors.grey),
        ),
        Expanded(
          child: Divider(
            color: context.colors.grey,
            thickness: lineThickness,
            indent: 30,
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}
