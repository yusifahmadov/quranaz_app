import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quranazapp/features/ayah/presentation/pages/ayah_page_view.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';
import 'package:quranazapp/features/surah/presentation/pages/surah_page_view.dart';
import 'package:quranazapp/injection.dart';

import '../../../../core/constant.dart';
import '../../../surah/presentation/pages/surah_search_view.dart';

extension on MainRoute {
  String get routePage => describeEnum(this);
}

enum MainRoute { homePage, allSurahPage, allAyahPage, oneAyahPage }

final Map<MainRoute, Widget> _fragments = {
  MainRoute.homePage: const HomePageView(),
  MainRoute.allSurahPage: const SurahPageView(),
  MainRoute.allAyahPage: AyahPageView(
      surahModel: SurahModel(
          arabic: '', ayahCount: 0, city: '', fullTitle: '', id: 0, juz: [1], order: 0, title: '')),
  MainRoute.oneAyahPage: const Scaffold(),
};

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: backGroundColor,
          title: Text(
            "quran.az",
            style: Theme.of(context).textTheme.headline3!.copyWith(color: mainColor),
          ),
        ),
      ),
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            const SurahSearchView(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Navigator(
                key: navigatorKey,
                initialRoute: MainRoute.allSurahPage.routePage,
                reportsRouteUpdateToEngine: true,
                onGenerateRoute: (settings) {
                  final pageName = settings.name;

                  final page = _fragments.keys.firstWhere((element) => describeEnum(element) == pageName);

                  return PageRouteBuilder(
                      settings: settings, pageBuilder: (ctx, __, ___) => _fragments[page]!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
