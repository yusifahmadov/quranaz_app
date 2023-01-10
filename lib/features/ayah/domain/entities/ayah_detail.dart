import 'package:json_annotation/json_annotation.dart';

class AyahDetail {
  @JsonKey(name: "soorah_id")
  final int soorahId;
  @JsonKey(name: "aya_id")
  final int ayaId;
  final String content;
  final String transliteration;
  final int juz;

  AyahDetail(
      {required this.ayaId,
      required this.content,
      required this.juz,
      required this.soorahId,
      required this.transliteration});
}
