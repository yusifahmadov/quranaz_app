import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quranazapp/core/constant.dart';
import 'package:quranazapp/features/ayah/data/models/ayah_model.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_one_ayah_helper_model.dart';
import 'package:quranazapp/features/ayah/presentation/bloc/ayah_bloc.dart';
import 'package:quranazapp/features/ayah/presentation/utility/number_suffix.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';

import '../../../../injection.dart';
import '../../../surah/presentation/pages/surah_search_view.dart';
import '../bloc/ayah_cubit.dart';

class AyahDetailPageView extends StatelessWidget {
  GetOneAyahHelperModel getOneAyahHelperModel;
  final SurahModel surahModel;
  AyahModel? ayahModel;
  AyahDetailPageView({Key? key, required this.getOneAyahHelperModel, required this.surahModel})
      : super(key: key);
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
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocProvider(
        create: (context) => getIt<AyahCubit>()..getOneAyah(model: getOneAyahHelperModel),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
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
                    if (state is OneAyahDataLoading) {
                      return const Center(
                        child: SizedBox(
                          width: 100,
                          height: 500,
                          child: Center(child: LinearProgressIndicator()),
                        ),
                      );
                    } else if (state is OneAyahDataFailed) {
                      return SizedBox(
                        height: 500,
                        child: Center(
                          child: Text(
                            state.data.success == false ? "Ayə tapılmadı!" : "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.red, fontSize: 18),
                          ),
                        ),
                      );
                    } else if (state is OneAyahDataLoaded) {
                      ayahModel = state.data.out;
                      List<String> translation = [];
                      translation = state.data.out.transliteration!.split(" ");

                      return Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${surahModel.id}. ${surahModel.title} surəsi, ${NumberSuffix.show(state.data.out.ayah)} ayə",
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
                                    state.data.out.arabic ?? "",
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 35),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                state.data.out.content,
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
                                  children: translation
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
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    if (ayahModel!.prev != null) {
                                      await context.read<AyahCubit>().getOneAyah(
                                          model: GetOneAyahHelperModel(
                                              translatorId: SurahSearchView.getAyatHelperModel.translatorId,
                                              ayahId: ayahModel!.prev!,
                                              surahId: surahModel.id));
                                    }
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 0,
                                          color:
                                              state.data.out.prev == null ? Colors.transparent : Colors.grey),
                                      color: state.data.out.prev == null
                                          ? const Color(0xffF8FAFB)
                                          : Colors.white,
                                    ),
                                    child: Center(
                                        child: Text(state.data.out.prev == null
                                            ? 1.toString()
                                            : state.data.out.prev.toString())),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                state.data.out.prev != null
                                    ? Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(width: 0, color: Colors.transparent),
                                          color: const Color(0xffF8FAFB),
                                        ),
                                        child: Center(child: Text(state.data.data.a.toString())),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  width: 10,
                                ),
                                state.data.out.next != null
                                    ? GestureDetector(
                                        onTap: () async {
                                          await context.read<AyahCubit>().getOneAyah(
                                              model: GetOneAyahHelperModel(
                                                  translatorId:
                                                      SurahSearchView.getAyatHelperModel.translatorId,
                                                  ayahId: ayahModel!.next!,
                                                  surahId: surahModel.id));
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                                width: 0,
                                                color: state.data.out.next == null
                                                    ? Colors.transparent
                                                    : Colors.grey),
                                            color: state.data.out.next == null
                                                ? const Color(0xffF8FAFB)
                                                : Colors.white,
                                          ),
                                          child: Center(
                                              child: Text(state.data.out.next == null
                                                  ? 1.toString()
                                                  : state.data.out.next.toString())),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
