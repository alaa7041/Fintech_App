import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoadingIndecator extends StatelessWidget {
  final double? size;
  final Color? color;
  const AppLoadingIndecator({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: color ?? context.colors.primary,
        size: size ?? 50.radius,
      ),
    );
  }
}
