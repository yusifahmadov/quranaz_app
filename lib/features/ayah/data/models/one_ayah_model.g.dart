// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_ayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneAyahModel _$OneAyahModelFromJson(Map<String, dynamic> json) => OneAyahModel(
      data: OutDataModel.fromJson(json['data'] as Map<String, dynamic>),
      out: AyahModel.fromJson(json['out'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OneAyahModelToJson(OneAyahModel instance) =>
    <String, dynamic>{
      'out': instance.out,
      'data': instance.data,
    };
