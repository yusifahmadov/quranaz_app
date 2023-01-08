import 'package:dartz/dartz.dart';
import 'package:quranazapp/core/response/response_model.dart';

import '../../data/models/one_ayah_model.dart';
import '../../data/models/ayah_model.dart';

abstract class AyahRepository {
  Future<Either<ResponseModel, OneAyahModel>> getOneAyah(int surahId, int ayahId, int translatorId);
  Future<Either<ResponseModel, List<AyahModel>>> getAyahs(
      int surahId, String? word, int? ayahId, int translatorId);
}
