// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signUp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      email: json['email'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      password_confirmation: json['password_confirmation'] as String,
      phone: json['phone'] as String,
      gender: (json['gender'] as num).toInt(),
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
      'gender': instance.gender,
    };
