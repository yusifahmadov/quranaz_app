import '../../domain/entities/surah.dart';

import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel extends Surah {
  SurahModel(
      {required super.arabic,
      required super.ayahCount,
      required super.city,
      required super.fullTitle,
      required super.id,
      required super.juz,
      required super.order,
      required super.title});
  factory SurahModel.fromJson(Map<String, dynamic> json) => _$SurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}
