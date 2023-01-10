import 'package:quranazapp/core/response/response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:quranazapp/core/usecase/usecase.dart';
import 'package:quranazapp/features/ayah/data/models/one_ayah_model.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_ayat_helper_model.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_one_ayah_helper_model.dart';
import 'package:quranazapp/features/ayah/domain/repositories/ayah_repository.dart';

import '../../../surah/data/models/one_surah_model.dart';

class GetOneAyahUseCase extends Usecase<OneAyahModel, GetOneAyahHelperModel> {
  AyahRepository ayahRepository;
  GetOneAyahUseCase(this.ayahRepository);
  @override
  Future<Either<ResponseModel, OneAyahModel>> call(GetOneAyahHelperModel params) {
    return ayahRepository.getOneAyah(params.surahId, params.ayahId, params.translatorId);
  }
}

class GetAyatUseCase extends Usecase<OneSurahModel, GetAyatHelperModel> {
  AyahRepository ayahRepository;
  GetAyatUseCase(this.ayahRepository);
  @override
  Future<Either<ResponseModel, OneSurahModel>> call(GetAyatHelperModel params) {
    return ayahRepository.getAyahs(params.surahId, params.word, params.ayahId, params.translatorId);
  }
}
