import 'package:dartz/dartz.dart';
import 'package:quranazapp/core/response/response_model.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';

abstract class SurahRepository {
  Future<Either<ResponseModel, List<SurahModel>>> getSurahs(String name);
}
