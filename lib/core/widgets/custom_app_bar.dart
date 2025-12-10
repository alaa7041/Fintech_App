import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withArrow;
  final bool? withCustomIcon;
  final Color? isCenterTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.withArrow = false,
    this.withCustomIcon,
    this.isCenterTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: withArrow,
      automaticallyImplyLeading: false,
      title: AppText(
        title: title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeightsHelper.bold,
          color: theme.primaryTextColor,
        ),
      ),
      leading: withArrow
          ? GestureDetector(
              onTap: () => RouteManager.pop(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: theme.primaryTextColor,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
