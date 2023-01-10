import 'package:dio/dio.dart';
import 'package:quranazapp/features/ayah/data/datasources/ayah_local_data_source.dart';
import 'package:quranazapp/features/ayah/data/datasources/ayah_remote_data_source.dart';
import 'package:quranazapp/features/ayah/data/models/one_ayah_model.dart';
import 'package:quranazapp/core/response/response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:quranazapp/features/ayah/domain/repositories/ayah_repository.dart';

import '../../../surah/data/models/one_surah_model.dart';

class AyahRepositoryImpl implements AyahRepository {
  AyahRemoteDataSource ayahRemoteDataSource;
  AyahLocalDataSource ayahLocalDataSource;
  AyahRepositoryImpl(this.ayahRemoteDataSource, this.ayahLocalDataSource);
  @override
  Future<Either<ResponseModel, OneAyahModel>> getOneAyah(int surahId, int ayahId, int translatorId) async {
    try {
      return Right(await ayahRemoteDataSource.getOneAyah(surahId, ayahId, translatorId));
    } on DioError catch (_) {
      return Left(ResponseModel.fromJson({"success": false}));
    }
  }

  @override
  Future<Either<ResponseModel, OneSurahModel>> getAyahs(
      int surahId, String? word, int? ayahId, int translatorId) async {
    try {
      return Right(await ayahLocalDataSource.getAyahs(surahId, word, ayahId, translatorId));
    } on DioError catch (_) {
      return Left(ResponseModel.fromJson({"success": false}));
    }
  }
}
