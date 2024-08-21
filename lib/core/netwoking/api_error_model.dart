import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

//! search how to hide auto genereate file
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final dynamic data;
  final int? code;

  ApiErrorModel({required this.message, this.code,this.data});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
