import 'package:json_annotation/json_annotation.dart';

class Ayah {
  final int id;
  final int soorah;
  final int ayah;
  final String content;
  final String? arabic;
  final int translator;
  final String? transliteration;
  final int? prev;
  final int? next;
  @JsonKey(name: "content_latinized")
  final String? contentLatinized;

  Ayah(
      {required this.ayah,
      required this.content,
      required this.prev,
      required this.next,
      required this.transliteration,
      required this.contentLatinized,
      required this.arabic,
      required this.id,
      required this.soorah,
      required this.translator});
}
