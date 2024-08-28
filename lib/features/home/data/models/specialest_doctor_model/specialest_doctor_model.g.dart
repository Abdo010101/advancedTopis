// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialest_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialestDoctorModel _$SpecialestDoctorModelFromJson(
        Map<String, dynamic> json) =>
    SpecialestDoctorModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecialestDoctorModelToJson(
        SpecialestDoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctors,
    };
