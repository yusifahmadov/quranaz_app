import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quranazapp/core/constant.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_ayat_helper_model.dart';
import 'package:quranazapp/features/ayah/presentation/bloc/ayah_bloc.dart';
import 'package:quranazapp/features/ayah/presentation/bloc/ayah_cubit.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';

import '../../../../injection.dart';
import '../../../surah/presentation/pages/surah_search_view.dart';
import '../utility/number_suffix.dart';

class AyahPageView extends StatelessWidget {
  final SurahModel surahModel;

  AyahPageView({Key? key, required this.surahModel}) : super(key: key);
  GetAyatHelperModel getAyatHelperModel =
      GetAyatHelperModel(surahId: 0, translatorId: SurahSearchView.getAyatHelperModel.translatorId);
  Color randomColorGenerator() {
    List<Color> colorList = [
      const Color(0xff3590DC),
      const Color(0xff6674CD),
      const Color(0xff9561E2),
      const Color(0xffF66C9A),
      const Color(0xffF6993E),
      const Color(0xff55C880),
      const Color(0xff4DC0B5)
    ];
    return colorList[Random().nextInt(7)];
  }

  @override
  Widget build(BuildContext context) {
    getAyatHelperModel.surahId = surahModel.id;

    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocProvider(
        create: (context) => getIt<AyahCubit>()..getAyahs(model: getAyatHelperModel),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 1.sh,
              decoration: BoxDecoration(
                  color: mainColor,
                  // boxShadow: [BoxShadow(blurRadius: 15, spreadRadius: 0, color: mainColor.withOpacity(0.5))],
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/surahnumber.svg",
                          color: Colors.white,
                        ),
                        Text(
                          surahModel.id.toString(),
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      surahModel.fullTitle.toString(),
                      style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          surahModel.city == "Məkkə" ? "assets/makkah.svg" : "assets/madinah.svg",
                          width: 15,
                          height: 15,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Text(
                            "${surahModel.city} / ${surahModel.ayahCount} ayə",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<AyahCubit, AyahState>(
              builder: (context, state) {
                if (state is AyatDataLoading) {
                  return const Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(),
                      ),
                    ),
                  );
                } else if (state is AyatDataFailed) {
                  return Center(
                    child: Text(state.data.success.toString()),
                  );
                } else if (state is AyatDataLoaded) {
                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: false,
                          itemCount: state.data.ayahs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "${surahModel.id}. ${surahModel.title} surəsi, ${NumberSuffix.show(state.data.ayahs[index].ayah)} ayə",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: const Color(0xff9BA3AF), fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      width: 1.sh,
                                      child: Text(
                                        state.data.ayahDetails[index].content,
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 35),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    state.data.ayahs[index].content,
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Wrap(
                                      children: state.data.ayahDetails[index].transliteration
                                          .split(" ")
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                child: Text(
                                                  e,
                                                  softWrap: true,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(color: randomColorGenerator()),
                                                ),
                                              ))
                                          .toList()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          }));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
