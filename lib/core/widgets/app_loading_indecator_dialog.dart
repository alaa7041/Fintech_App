import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void showLoadingDialog({required BuildContext context, Color? barrierColor}) {
  showDialog(
    barrierDismissible: false,
    barrierColor: barrierColor,
    context: context,
    builder: (_) => Center(
      child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50),
    ),
  );
}
