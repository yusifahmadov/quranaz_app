import 'package:quranazapp/features/ayah/domain/entities/ayah_detail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ayah_detail_model.g.dart';

@JsonSerializable()
class AyahDetailModel extends AyahDetail {
  AyahDetailModel(
      {required super.ayaId,
      required super.content,
      required super.juz,
      required super.soorahId,
      required super.transliteration});

  factory AyahDetailModel.fromJson(Map<String, dynamic> json) => _$AyahDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AyahDetailModelToJson(this);
}
