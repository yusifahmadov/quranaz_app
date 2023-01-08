// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahModel _$AyahModelFromJson(Map<String, dynamic> json) => AyahModel(
      ayah: json['ayah'] as int,
      content: json['content'] as String,
      contentLatinized: json['content_latinized'] as String?,
      id: json['id'] as int,
      next: json['next'] as int?,
      prev: json['prev'] as int?,
      transliteration: json['transliteration'] as String?,
      arabic: json['arabic'] as String?,
      soorah: json['soorah'] as int,
      translator: json['translator'] as int,
    );

Map<String, dynamic> _$AyahModelToJson(AyahModel instance) => <String, dynamic>{
      'id': instance.id,
      'soorah': instance.soorah,
      'ayah': instance.ayah,
      'content': instance.content,
      'arabic': instance.arabic,
      'translator': instance.translator,
      'transliteration': instance.transliteration,
      'prev': instance.prev,
      'next': instance.next,
      'content_latinized': instance.contentLatinized,
    };
