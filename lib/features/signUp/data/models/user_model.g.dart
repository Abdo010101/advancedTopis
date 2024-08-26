// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };
