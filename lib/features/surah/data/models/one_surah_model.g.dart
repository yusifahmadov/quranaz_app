// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneSurahModel _$OneSurahModelFromJson(Map<String, dynamic> json) =>
    OneSurahModel(
      ayahDetails: (json['ayahDetails'] as List<dynamic>)
          .map((e) => AyahDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ayahs: (json['ayahs'] as List<dynamic>)
          .map((e) => AyahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OneSurahModelToJson(OneSurahModel instance) =>
    <String, dynamic>{
      'ayahs': instance.ayahs,
      'ayahDetails': instance.ayahDetails,
    };
