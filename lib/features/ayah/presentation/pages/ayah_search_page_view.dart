import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranazapp/core/constant.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_ayat_helper_model.dart';

import '../../../../core/highlighter.dart';
import '../../../../injection.dart';
import '../../../surah/data/models/surah_model.dart';
import '../../../surah/presentation/bloc/surah_cubit.dart';
import '../../../surah/presentation/pages/surah_search_view.dart';
import '../../data/models/helper/get_one_ayah_helper_model.dart';
import '../bloc/ayah_bloc.dart';
import '../bloc/ayah_cubit.dart';
import 'ayah_detail_page_view.dart';

class AyahSearchPageView extends StatelessWidget {
  final GetAyatHelperModel getAyatHelperModel;

  const AyahSearchPageView({Key? key, required this.getAyatHelperModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocProvider(
        create: (context) => getIt<AyahCubit>()..getAyahs(model: getAyatHelperModel),
        child: Column(
          children: [
            BlocBuilder<AyahCubit, AyahState>(
              builder: (context, state) {
                if (state is AyatDataLoading) {
                  return const Center(
                    child: SizedBox(
                      width: 100,
                      child: LinearProgressIndicator(),
                    ),
                  );
                } else if (state is AyatDataFailed) {
                  return Center(
                    child: Text(state.data.success.toString()),
                  );
                } else if (state is AyatDataLoaded) {
                  return state.data.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              shrinkWrap: false,
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  child: GestureDetector(
                                    onTap: () async {
                                      List<SurahModel> surahList = await getIt<SurahCubit>().getSurahList("");

                                      navigatorKey.currentState?.push(PageRouteBuilder(
                                          pageBuilder: (_, __, ___) => AyahDetailPageView(
                                              getOneAyahHelperModel: GetOneAyahHelperModel(
                                                  ayahId: state.data[index].ayah,
                                                  translatorId:
                                                      SurahSearchView.getAyatHelperModel.translatorId,
                                                  surahId: state.data[index].soorah),
                                              surahModel: surahList
                                                  .where((element) => element.id == state.data[index].ayah)
                                                  .first)));
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
                                            child: Center(
                                                child: Text(
                                                    "${state.data[index].soorah}:${state.data[index].ayah}")),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Flexible(
                                          child: RichText(
                                            text: TextSpan(
                                              children: highlightOccurrences(state.data[index].content,
                                                  SurahSearchView.getAyatHelperModel.word ?? ""),
                                              style: Theme.of(context).textTheme.bodyText2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }))
                      : Expanded(
                          child: Center(
                            child: Text(
                              "Kəlmə tapılmadı!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.red, fontSize: 18),
                            ),
                          ),
                        );
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
