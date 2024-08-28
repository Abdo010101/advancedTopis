// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialestResponse _$SpecialestResponseFromJson(Map<String, dynamic> json) =>
    SpecialestResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SpecialestDoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecialestResponseToJson(SpecialestResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
