import 'package:fintech_app/core/theming/app_theme.dart';
import 'package:fintech_app/core/theming/theme_notifier.dart';
import 'package:fintech_app/feature/auth/login/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/constants.dart';
import 'core/routing/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(390, 812),
        builder: (_, child) {
          return ValueListenableBuilder(
            valueListenable: ThemeNotifier.themeMode,
            builder: (BuildContext context, value, Widget? child) {
              return MaterialApp(
                useInheritedMediaQuery: true,
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                title: appName,

                theme: AppTheme.light,
                darkTheme: AppTheme.dark,

                themeMode: ThemeNotifier.themeMode.value,
                home: LoginScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
