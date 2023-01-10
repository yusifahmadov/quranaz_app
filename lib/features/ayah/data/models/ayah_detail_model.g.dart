// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahDetailModel _$AyahDetailModelFromJson(Map<String, dynamic> json) =>
    AyahDetailModel(
      ayaId: json['aya_id'] as int,
      content: json['content'] as String,
      juz: json['juz'] as int,
      soorahId: json['soorah_id'] as int,
      transliteration: json['transliteration'] as String,
    );

Map<String, dynamic> _$AyahDetailModelToJson(AyahDetailModel instance) =>
    <String, dynamic>{
      'soorah_id': instance.soorahId,
      'aya_id': instance.ayaId,
      'content': instance.content,
      'transliteration': instance.transliteration,
      'juz': instance.juz,
    };
