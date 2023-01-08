import 'package:quranazapp/core/response/response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:quranazapp/core/usecase/usecase.dart';
import 'package:quranazapp/features/ayah/data/models/one_ayah_model.dart';
import 'package:quranazapp/features/ayah/data/models/ayah_model.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_ayat_helper_model.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_one_ayah_helper_model.dart';
import 'package:quranazapp/features/ayah/domain/repositories/ayah_repository.dart';

class GetOneAyahUseCase extends Usecase<OneAyahModel, GetOneAyahHelperModel> {
  AyahRepository ayahRepository;
  GetOneAyahUseCase(this.ayahRepository);
  @override
  Future<Either<ResponseModel, OneAyahModel>> call(GetOneAyahHelperModel params) {
    return ayahRepository.getOneAyah(params.surahId, params.ayahId, params.translatorId);
  }
}

class GetAyatUseCase extends Usecase<List<AyahModel>, GetAyatHelperModel> {
  AyahRepository ayahRepository;
  GetAyatUseCase(this.ayahRepository);
  @override
  Future<Either<ResponseModel, List<AyahModel>>> call(GetAyatHelperModel params) {
    return ayahRepository.getAyahs(params.surahId, params.word, params.ayahId, params.translatorId);
  }
}
