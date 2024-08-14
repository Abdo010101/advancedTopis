import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  //** NOTE very important we send the paramater without null operator
  // * casue i send request with this paramter the null check not necessary here */
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});
  //! this request so i need to pass this code of dart into josn so we have use toJson
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
