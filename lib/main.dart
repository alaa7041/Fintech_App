import 'package:bloc/bloc.dart';
import 'package:fintech_app/core/helpers/bloc_observer.dart';
import 'package:fintech_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
    await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = MyBlocObserver();
  
  runApp(const MyApp());
}