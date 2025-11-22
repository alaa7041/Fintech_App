
import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/colors_manager.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? radius;
  final Widget? widget;
  final BoxBorder? boxBorder;
  final Color? color, textColor;
  final Color? loaderColor;
  final Function()? onPressed;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    this.height,
    this.onPressed,
    this.width,
    this.radius = 8,
    this.boxBorder,
    this.color,
    this.textColor,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textStyle,
    this.isLoading = false,
    this.widget,
    this.loaderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 48.height,
        width: width ?? double.infinity,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            border: boxBorder,
            color: color ?? ColorsManager.primary),
        child: isLoading
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: LoadingAnimationWidget.progressiveDots(
                    color: loaderColor ?? Colors.white,
                    size: 50,
                  ),
                ),
              )
            : Center(
                child: widget ??
                    AppText(
                      title: text,
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 14.font,
                      fontWeight: fontWeight ?? FontWeightsHelper.medium,
                      style: textStyle ??
                          TextStyle(
                            color: textColor ?? Colors.white,
                            fontSize: fontSize ?? 14.font,
                            fontWeight: fontWeight ?? FontWeightsHelper.medium,
                          ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: textAlign ?? TextAlign.center,
                    ),
              ),
      ),
    );
  }
}
