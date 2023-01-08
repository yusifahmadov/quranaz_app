import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quranazapp/core/constant.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_ayat_helper_model.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_one_ayah_helper_model.dart';
import 'package:quranazapp/features/ayah/presentation/bloc/ayah_bloc.dart';
import 'package:quranazapp/features/ayah/presentation/bloc/ayah_cubit.dart';
import 'package:quranazapp/features/ayah/presentation/pages/ayah_detail_page_view.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';

import '../../../../injection.dart';
import '../../../surah/presentation/pages/surah_search_view.dart';

class AyahPageView extends StatelessWidget {
  final SurahModel surahModel;

  AyahPageView({Key? key, required this.surahModel}) : super(key: key);
  GetAyatHelperModel getAyatHelperModel =
      GetAyatHelperModel(surahId: 0, translatorId: SurahSearchView.getAyatHelperModel.translatorId);
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
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                              child: GestureDetector(
                                onTap: () {
                                  navigatorKey.currentState?.push(PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => AyahDetailPageView(
                                          getOneAyahHelperModel: GetOneAyahHelperModel(
                                              ayahId: state.data[index].ayah,
                                              translatorId: SurahSearchView.getAyatHelperModel.translatorId,
                                              surahId: state.data[index].soorah),
                                          surahModel: surahModel)));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IntrinsicWidth(
                                      stepHeight: state.data[index].content.length / 45 * 25,
                                      stepWidth: state.data[index].id.toString().length * 10,
                                      child: Container(
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffE4E7EB),
                                            borderRadius: BorderRadius.circular(6)),
                                        child: Center(child: Text(state.data[index].ayah.toString())),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Flexible(
                                      child: Text(
                                        state.data[index].content,
                                        overflow: TextOverflow.fade,
                                        maxLines: 10,
                                      ),
                                    ),
                                  ],
                                ),
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
