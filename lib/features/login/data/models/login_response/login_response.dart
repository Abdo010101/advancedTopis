import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  Data? data;
  bool? status;
  num? code;

  LoginResponse({this.message, this.data, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
