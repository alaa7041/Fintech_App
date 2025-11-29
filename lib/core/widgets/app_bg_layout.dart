import 'package:flutter/material.dart';

import '../helpers/utils.dart';

class AppBackgroundLayout extends StatelessWidget {
  final Widget? appBar;
  final Widget child;

  const AppBackgroundLayout({super.key, this.appBar, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Utils.getAssetPNGPath(
              Utils.isDarkMode(context) ? "bg_dark" : "bg_light",
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            if (appBar != null) appBar!,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
