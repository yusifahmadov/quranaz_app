import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:quranazapp/features/surah/data/models/surah_model.dart';

abstract class SurahLocalDataSource {
  Future<List<SurahModel>> getSurahs(String name);
}

class SurahLocalDataSourceImpl implements SurahLocalDataSource {
  @override
  Future<List<SurahModel>> getSurahs(String name) async {
    final response = await rootBundle.loadString("assets/surah.json");
    List data = json.decode(response);

    List<SurahModel> listData = name != ""
        ? data
            .map((e) => SurahModel.fromJson(e))
            .toList()
            .where((element) => element.title.toLowerCase().contains(name.toLowerCase()))
            .toList()
        : data.map((e) => SurahModel.fromJson(e)).toList();
    listData.sort((a, b) => a.id.compareTo(b.id));

    return listData;
  }
}
