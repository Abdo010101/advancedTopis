import 'package:freezed_annotation/freezed_annotation.dart';

import 'doctor.dart';

part 'specialest_doctor_model.g.dart';

@JsonSerializable()
class SpecialestDoctorModel {
  num? id;
  String? name;
  List<Doctor>? doctors;

  SpecialestDoctorModel({this.id, this.name, this.doctors});

  factory SpecialestDoctorModel.fromJson(Map<String, dynamic> json) {
    return _$SpecialestDoctorModelFromJson(json);
  }
}
