import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranazapp/core/response/response_model.dart';
import 'package:quranazapp/features/surah/data/models/surah_model.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  SurahBloc() : super(SurahInitial()) {
    on<SurahEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
