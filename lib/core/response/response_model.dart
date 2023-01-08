import 'package:quranazapp/core/response/response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel extends Response {
  ResponseModel({required super.success});
  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
