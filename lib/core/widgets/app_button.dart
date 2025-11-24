
import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
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
    final colors = Theme.of(context).extension<AppColorsExtension>()!;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 40.height,
        width: width ?? double.infinity,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 31.radius),
            border: boxBorder,
            color: color ?? colors.primary),
        child: isLoading
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: LoadingAnimationWidget.progressiveDots(
                    color: loaderColor ?? colors.btnTextColor,
                    size: 50,
                  ),
                ),
              )
            : Center(
                child: widget ??
                    AppText(
                      title: text,
                      color: textColor ?? colors.btnTextColor,
                      fontSize: fontSize ?? 18.font,
                      fontWeight: fontWeight ?? FontWeightsHelper.bold,
                      style: textStyle ??
                          TextStyle(
                            color: textColor ?? colors.btnTextColor,
                            fontSize: fontSize ?? 18.font,
                            fontWeight: fontWeight ?? FontWeightsHelper.bold,
                            overflow: TextOverflow.visible
                          ),
                      overflow: TextOverflow.visible,
                      textAlign: textAlign ?? TextAlign.center,
                    ),
              ),
      ),
    );
  }
}
