part of 'surah_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahInitial extends SurahState {}

class SurahDataLoaded extends SurahState {
  final List<SurahModel> surahs;
  const SurahDataLoaded({required this.surahs});
}

class SurahDataLoading extends SurahState {}

class SurahDataFailed extends SurahState {
  final ResponseModel data;
  const SurahDataFailed({required this.data});
}
