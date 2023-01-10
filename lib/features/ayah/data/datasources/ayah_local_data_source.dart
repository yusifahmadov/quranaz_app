import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quranazapp/features/ayah/data/models/ayah_detail_model.dart';
import 'package:quranazapp/features/ayah/data/models/ayah_model.dart';
import 'package:quranazapp/features/surah/data/models/one_surah_model.dart';

abstract class AyahLocalDataSource {
  Future<OneSurahModel> getAyahs(int surahId, String? word, int? ayahId, int translatorId);
}

class AyahLocalDataSourceImpl implements AyahLocalDataSource {
  @override
  Future<OneSurahModel> getAyahs(int surahId, String? word, int? ayahId, int? translatorId) async {
    final response = await rootBundle.loadString("assets/ayah.json");
    final ayahDetailResponse = await rootBundle.loadString("assets/details.json");

    List data = json.decode(response);
    List ayahDetailData = json.decode(ayahDetailResponse);
    List<AyahModel> listData = data
        .map((e) => AyahModel.fromJson(e))
        .toList()
        .where((element) =>
            (surahId == 0 ? true : element.soorah == surahId) &&
            (element.translator == translatorId) &&
            (ayahId == null ? true : element.ayah == ayahId) &&
            (word == null ? true : element.content.contains(word)))
        .toList();
    listData.sort((a, b) => a.id.compareTo(b.id));

    List<AyahDetailModel> ayahDetailList = ayahDetailData
        .map((e) => AyahDetailModel.fromJson(e))
        .toList()
        .where((element) => (surahId == 0 ? true : element.soorahId == surahId))
        .toList();
    listData.sort((a, b) => a.id.compareTo(b.id));

    OneSurahModel surahModel = OneSurahModel(ayahDetails: ayahDetailList, ayahs: listData);

    return surahModel;
  }
}
