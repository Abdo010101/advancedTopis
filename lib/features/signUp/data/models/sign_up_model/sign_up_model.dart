import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';
part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? message;
  Data? data;
  bool? status;
  num? code;

  SignUpModel({this.message, this.data, this.status, this.code});

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}
