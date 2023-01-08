import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quranazapp/core/bloc_observer.dart';
import 'package:quranazapp/core/color_config/theme/app_theme.dart';
import 'package:quranazapp/features/app.dart';
import 'injection.dart' as injection;

Future<void> main() async {
  await injection.initalize();
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
      () => {
            runApp(MaterialApp(
              theme: ThemeManager.craeteTheme(AppThemeLight()),
              debugShowCheckedModeBanner: false,
              home: const App(),
            )),
          },
      blocObserver: AppBlocObserver());
}
