import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'app_text.dart';

class SuccessDialogHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign? titleTextAlign;
  const SuccessDialogHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleTextAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: title,
          fontSize: 16.font,
          fontWeight: FontWeight.bold,
          textAlign: titleTextAlign ?? TextAlign.center,
        ),
        if (subtitle != null) ...[
          Gap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: AppText(
              title: subtitle ?? "",
              fontSize: 12.font,
              color: context.colors.textColor,
              textAlign: titleTextAlign ?? TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }
}
