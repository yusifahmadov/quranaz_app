part of 'ayah_bloc.dart';

abstract class AyahState extends Equatable {
  const AyahState();

  @override
  List<Object> get props => [];
}

class AyahInitial extends AyahState {}

class OneAyahDataLoaded extends AyahState {
  final OneAyahModel data;
  const OneAyahDataLoaded({required this.data});
}

class OneAyahDataLoading extends AyahState {}

class OneAyahDataFailed extends AyahState {
  final ResponseModel data;
  const OneAyahDataFailed({required this.data});
}

class AyatDataLoaded extends AyahState {
  final OneSurahModel data;
  const AyatDataLoaded({required this.data});
}

class AyatDataLoading extends AyahState {}

class AyatDataFailed extends AyahState {
  final ResponseModel data;
  const AyatDataFailed({required this.data});
}
