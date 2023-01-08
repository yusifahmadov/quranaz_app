import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranazapp/features/ayah/data/models/one_ayah_model.dart';
import 'package:quranazapp/features/ayah/data/models/ayah_model.dart';

import '../../../../core/response/response_model.dart';

part 'ayah_event.dart';
part 'ayah_state.dart';

class AyahBloc extends Bloc<AyahEvent, AyahState> {
  AyahBloc() : super(AyahInitial()) {
    on<AyahEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
