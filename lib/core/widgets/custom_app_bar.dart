import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withArrow;
  final bool? withCustomIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.withArrow = false,
    this.withCustomIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: AppText(
        title: title,
        style: TextStyle(fontSize: 24.font, fontWeight: FontWeightsHelper.bold,color: colors.primaryTextColor),
      ),
      leading: withArrow
          ? GestureDetector(
              onTap: () => RouteManager.pop(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.arrow_back, size: 16.font,color: colors.primaryTextColor,),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
