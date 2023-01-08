import 'package:bloc/bloc.dart';
import 'package:quranazapp/features/ayah/data/models/helper/get_ayat_helper_model.dart';
import 'package:quranazapp/features/ayah/domain/usecases/ayah_usecase.dart';

import '../../data/models/helper/get_one_ayah_helper_model.dart';
import 'ayah_bloc.dart';

class AyahCubit extends Cubit<AyahState> {
  final GetOneAyahUseCase _getOneAyahUseCase;
  final GetAyatUseCase _getAyatUseCase;
  AyahCubit(this._getAyatUseCase, this._getOneAyahUseCase) : super(AyahInitial());

  getOneAyah({required GetOneAyahHelperModel model}) async {
    emit(OneAyahDataLoading());
    final response = await _getOneAyahUseCase(model);
    response.fold((l) => emit(OneAyahDataFailed(data: l)), (r) => emit(OneAyahDataLoaded(data: r)));
  }

  getAyahs({required GetAyatHelperModel model}) async {
    emit(AyatDataLoading());
    final response = await _getAyatUseCase(model);
    response.fold((l) => emit(AyatDataFailed(data: l)), (r) => emit(AyatDataLoaded(data: r)));
  }
}
