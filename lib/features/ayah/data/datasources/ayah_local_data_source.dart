import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quranazapp/features/ayah/data/models/ayah_model.dart';

abstract class AyahLocalDataSource {
  Future<List<AyahModel>> getAyahs(int surahId, String? word, int? ayahId, int translatorId);
}

class AyahLocalDataSourceImpl implements AyahLocalDataSource {
  @override
  Future<List<AyahModel>> getAyahs(int surahId, String? word, int? ayahId, int? translatorId) async {
    final response = await rootBundle.loadString("assets/ayah.json");
    List data = json.decode(response);

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

    return listData;
  }
}
