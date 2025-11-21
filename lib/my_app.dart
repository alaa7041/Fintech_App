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
          return  MaterialApp(
              useInheritedMediaQuery: true,
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: appName,
              theme: ThemeData(
                  fontFamily: 'Lato',
                  scaffoldBackgroundColor: const Color(0xFFFFFFFE)),
              home: Scaffold(),
            )
          ;
        },
      ),
    );
  }
}