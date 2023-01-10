import 'package:quranazapp/features/ayah/data/models/ayah_detail_model.dart';
import 'package:quranazapp/features/ayah/data/models/ayah_model.dart';
import 'package:quranazapp/features/surah/domain/entities/one_surah.dart';
import 'package:json_annotation/json_annotation.dart';
part 'one_surah_model.g.dart';

@JsonSerializable()
class OneSurahModel extends OneSurah {
  OneSurahModel({required List<AyahDetailModel> ayahDetails, required List<AyahModel> ayahs})
      : super(ayahDetails: ayahDetails, ayahs: ayahs);

  factory OneSurahModel.fromJson(Map<String, dynamic> json) => _$OneSurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$OneSurahModelToJson(this);
}
