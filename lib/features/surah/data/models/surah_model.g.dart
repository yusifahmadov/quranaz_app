// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
      arabic: json['arabic'] as String,
      ayahCount: json['ayahCount'] as int,
      city: json['city'] as String,
      fullTitle: json['fullTitle'] as String,
      id: json['id'] as int,
      juz: (json['juz'] as List<dynamic>).map((e) => e as int).toList(),
      order: json['order'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'ayahCount': instance.ayahCount,
      'order': instance.order,
      'arabic': instance.arabic,
      'city': instance.city,
      'juz': instance.juz,
    };
