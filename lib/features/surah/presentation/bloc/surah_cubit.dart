import 'package:bloc/bloc.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';
import 'package:quranazapp/features/surah/domain/usecases/surah_usecase.dart';
import 'package:quranazapp/features/surah/presentation/bloc/surah_bloc.dart';

class SurahCubit extends Cubit<SurahState> {
  final GetSurahsUseCase _getSurahsUseCase;
  SurahCubit(this._getSurahsUseCase) : super(SurahInitial());

  getSurahs({required String name}) async {
    emit(SurahDataLoading());
    final response = await _getSurahsUseCase(name);
    response.fold((l) => emit(SurahDataFailed(data: l)), (r) => emit(SurahDataLoaded(surahs: r)));
  }

  Future<List<SurahModel>> getSurahList(String name) async {
    final response = await _getSurahsUseCase("");
    List<SurahModel> data = [];
    response.fold((l) => null, (r) {
      data = r;
    });

    data = data.where((element) => element.title.toLowerCase().contains(name.toLowerCase())).toList();
    return data;
  }
}
