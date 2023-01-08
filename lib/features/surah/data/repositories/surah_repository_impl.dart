import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quranazapp/features/surah/data/datasources/surah_local_data_source.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';

import '../../../../core/response/response_model.dart';
import '../../domain/repositories/surah_repository.dart';

class SurahRepositoryImpl implements SurahRepository {
  SurahLocalDataSource surahLocalDataSource;
  SurahRepositoryImpl(this.surahLocalDataSource);
  @override
  Future<Either<ResponseModel, List<SurahModel>>> getSurahs(String name) async {
    try {
      return Right(await surahLocalDataSource.getSurahs(name));
    } on DioError catch (_) {
      return Left(ResponseModel.fromJson({"success": false}));
    }
  }
}
