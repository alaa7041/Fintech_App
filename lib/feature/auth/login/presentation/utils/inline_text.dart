import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InlineText extends StatelessWidget {
  final String? title, subTitle;
  final Widget? widget;
  final MainAxisAlignment align;
  final Function()? onTap;
  final bool withWidget;

  const InlineText({
    super.key,
    this.align = MainAxisAlignment.center,
    this.onTap,
    this.widget,
    this.withWidget = false,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        if (withWidget) ...[
          Container(
            margin: EdgeInsets.only(right: 5.width),
            height: 18.height,
            width: 18.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: context.colors.primary, width: 2.width),
            ),
            child: Center(
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 14.sp,
              ),
            ),
          ),
          Expanded(
            child: AppText(
              title: "${title?.tr() ?? ""} ",
              style: TextStyle(
                fontSize: 12.font,
                fontWeight: FontWeightsHelper.semiBold,
              ),
            ),
          ),
        ],
        withWidget
            ? SizedBox.shrink()
            : AppText(
                title: "${title?.tr() ?? ""} ",
                style: TextStyle(
                  fontSize: 12.font,
                  fontWeight: FontWeightsHelper.semiBold,
                  
                ),
              ),

        AppText(
          title: subTitle ?? "",
          onTap: onTap,

          style: TextStyle(
            fontSize: 12.font,
            fontWeight: FontWeightsHelper.semiBold,
          ),
        ),
      ],
    );
  }
}
