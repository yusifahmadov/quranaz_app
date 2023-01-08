import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/ayah_all.dart';
import 'ayah_model.dart';
import 'out_data_model.dart';
part 'one_ayah_model.g.dart';

@JsonSerializable()
class OneAyahModel extends OneAyah {
  OneAyahModel({required OutDataModel data, required AyahModel out}) : super(data: data, out: out);
  factory OneAyahModel.fromJson(Map<String, dynamic> json) => _$OneAyahModelFromJson(json);

  Map<String, dynamic> toJson() => _$OneAyahModelToJson(this);
}
