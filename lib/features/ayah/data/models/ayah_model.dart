import '../../domain/entities/ayah.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ayah_model.g.dart';

@JsonSerializable()
class AyahModel extends Ayah {
  AyahModel(
      {required super.ayah,
      required super.content,
      required super.contentLatinized,
      required super.id,
      required super.next,
      required super.prev,
      required super.transliteration,
      required super.arabic,
      required super.soorah,
      required super.translator});

  factory AyahModel.fromJson(Map<String, dynamic> json) => _$AyahModelFromJson(json);

  Map<String, dynamic> toJson() => _$AyahModelToJson(this);
}
