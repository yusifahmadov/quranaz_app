import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/out_data.dart';

part 'out_data_model.g.dart';

@JsonSerializable()
class OutDataModel extends OutData {
  OutDataModel({required super.a, required super.q, required super.s, required super.t, required super.view});

  factory OutDataModel.fromJson(Map<String, dynamic> json) => _$OutDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OutDataModelToJson(this);
}
