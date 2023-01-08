import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quranazapp/core/constant.dart';
import 'package:quranazapp/features/ayah/presentation/pages/ayah_page_view.dart';
import 'package:quranazapp/features/surah/presentation/bloc/surah_bloc.dart';
import 'package:quranazapp/features/surah/presentation/bloc/surah_cubit.dart';

import '../../../../injection.dart';

class SurahPageView extends StatelessWidget {
  const SurahPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocProvider(
        create: (context) => getIt<SurahCubit>()..getSurahs(name: ""),
        child: Builder(builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Column(
              children: [
                _listBuilder(),
              ],
            );
          });
        }),
      ),
    );
  }

  BlocBuilder<SurahCubit, SurahState> _listBuilder() {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahDataLoading) {
          return const Center(
            child: SizedBox(
              width: 100,
              child: LinearProgressIndicator(),
            ),
          );
        } else if (state is SurahDataFailed) {
          return Center(
            child: Text(state.data.success.toString()),
          );
        } else if (state is SurahDataLoaded) {
          return Expanded(
              child: ListView.builder(
                  itemCount: state.surahs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigatorKey.currentState?.push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => AyahPageView(surahModel: state.surahs[index])));
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: backGroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(child: Text(state.surahs[index].id.toString())),
                                  SvgPicture.asset("assets/surahnumber.svg"),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.surahs[index].fullTitle,
                                    style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 16),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        state.surahs[index].city == "Məkkə"
                                            ? "assets/makkah.svg"
                                            : "assets/madinah.svg",
                                        width: 15,
                                        height: 15,
                                        color: mainColor,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          "${state.surahs[index].city} / ${state.surahs[index].ayahCount} ayə",
                                          style:
                                              Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                state.surahs[index].arabic,
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: mainColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
