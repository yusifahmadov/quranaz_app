import 'package:dartz/dartz.dart';
import 'package:quranazapp/core/response/response_model.dart';

import '../../../surah/data/models/one_surah_model.dart';
import '../../data/models/one_ayah_model.dart';

abstract class AyahRepository {
  Future<Either<ResponseModel, OneAyahModel>> getOneAyah(int surahId, int ayahId, int translatorId);
  Future<Either<ResponseModel, OneSurahModel>> getAyahs(
      int surahId, String? word, int? ayahId, int translatorId);
}
