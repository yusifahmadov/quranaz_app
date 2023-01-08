import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quranazapp/features/home/presentation/pages/home_page_view.dart';
import 'package:quranazapp/features/surah/presentation/pages/surah_page_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return child!;
        },
        child: const HomePageView());
  }
}
