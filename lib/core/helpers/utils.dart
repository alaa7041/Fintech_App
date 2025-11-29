import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/global/dimensions.dart';
import 'package:fintech_app/core/routing/route_manager.dart';
import 'package:fintech_app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
 

  static Color getColor(String color) {
    final myColor = "0xff${color.replaceFirst("#", "")}".tr();
    return Color(int.parse(myColor));
  }

   static isDarkMode(context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String getAssetPNGPath(String image) {
    return 'assets/images/$image.png';
  }

  static String getImagesSVGPath(String image) {
    return 'assets/images/$image.svg';
  }

  static String getIconsSVGPath(String image) {
    return 'assets/icons/$image.svg';
  }

  static String getIconsPNGPath(String image) {
    return 'assets/icons/$image.png';
  }

  static String getAssetGIFPath(String image) {
    return 'assets/images/gif/$image.gif';
  }

  static String getAssetLottiePath(String image) {
    return 'assets/images/lottie/$image.json';
  }

  static String getAssetDummyPNGPath(String image) {
    return 'assets/dummy/$image.png';
  }

  static String getAssetDummyJPGPath(String image) {
    return 'assets/dummy/$image.jpg';
  }

  static double get bottomDevicePadding {
    final bottom = MediaQuery.of(RouteManager.currentContext).padding.bottom;
    if (bottom < 16) {
      return 16.h;
    }
    return bottom;
  }

  static double get topDevicePadding {
    final top = MediaQuery.of(RouteManager.currentContext).padding.top;
    // if (top < 44) {
    //   return 44.height;
    // }
    return top;
  }

  static double get appBarHeight {
    return AppBar().preferredSize.height;
  }

  static EdgeInsets get viewPadding {
    return EdgeInsets.fromLTRB(20.width, 20.height, 20.width, 0);
  }

  static double keyboardHeight(
    context, {
    bool subtractBottomDevicePadding = false,
  }) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    if (keyboardHeight == 0) {
      return keyboardHeight;
    }
    keyboardHeight += 16.h;
    if (subtractBottomDevicePadding) {
      return keyboardHeight - bottomDevicePadding;
    }
    return keyboardHeight;
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String getFileNameFromURL(String url, String symbol) =>
      url.substring(url.lastIndexOf(symbol) + 1);

}
