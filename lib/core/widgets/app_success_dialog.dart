import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/helpers/utils.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:fintech_app/core/theming/font_weights_helper.dart';
import 'package:fintech_app/core/widgets/app_button.dart';
import 'package:fintech_app/core/widgets/success_dialog_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AppSuccessDialog extends StatelessWidget {
  final String contentText;
  final String? confirmationText;
  final String? subtitle;
  final TextAlign? titleTextAlign;
  final Widget? bodyWidget;
  final void Function()? onConfirm;
  final double? buttonHeight;
  final String? bodyPngImage;

  const AppSuccessDialog({
    super.key,
    required this.contentText,
    this.subtitle,
    this.titleTextAlign,
    this.confirmationText,
    this.bodyWidget,
    this.onConfirm,
    this.buttonHeight,
    this.bodyPngImage,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String contentText,
    String? subtitle,
    TextAlign? titleTextAlign,
    String? confirmationText,
    Widget? bodyWidget,
    void Function()? onConfirm,
    bool barrierDismissible = true,
    double? buttonHeight,
    String? bodyPngImage,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AppSuccessDialog(
          contentText: contentText,
          subtitle: subtitle,
          titleTextAlign: titleTextAlign,
          confirmationText: confirmationText,
          bodyWidget: bodyWidget,
          onConfirm: onConfirm,
          buttonHeight: buttonHeight,
          bodyPngImage: bodyPngImage,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Utils.getImagesSVGPath(bodyPngImage ?? "success")),
            Gap(24),
            SuccessDialogHeader(
              title: contentText,
              subtitle: subtitle,
              titleTextAlign: titleTextAlign,
            ),
            Gap(24),
            if (bodyWidget != null) ...[bodyWidget!, Gap(24)],
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: buttonHeight,
                    text: confirmationText ?? "Continue",
                    textStyle: TextStyle(
                      fontSize: 18.font,
                      color: context.colors.btnTextColor,
                      fontWeight: FontWeightsHelper.bold,
                    ),
                    onPressed: () {
                      RouteManager.pop();
                      onConfirm?.call();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
