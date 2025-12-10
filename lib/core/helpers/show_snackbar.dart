import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(
  String message, {
  Color? color,
  int seconds = 3,
  bool isError = false,
}) {
  ScaffoldMessenger.of(RouteManager.currentContext).showSnackBar(
    SnackBar(
      duration: Duration(seconds: seconds),
      content: AppText(
        title: message,
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: isError ? Colors.red : color ?? Colors.green,
    ),
  );
}
