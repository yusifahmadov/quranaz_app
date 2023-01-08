import 'package:dartz/dartz.dart';
import 'package:quranazapp/core/response/response_model.dart';
import 'package:quranazapp/core/usecase/usecase.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';
import 'package:quranazapp/features/surah/domain/repositories/surah_repository.dart';

class GetSurahsUseCase extends Usecase<List<SurahModel>, String> {
  SurahRepository surahRepository;
  GetSurahsUseCase(this.surahRepository);
  @override
  Future<Either<ResponseModel, List<SurahModel>>> call(String params) {
    return surahRepository.getSurahs(params);
  }
}
