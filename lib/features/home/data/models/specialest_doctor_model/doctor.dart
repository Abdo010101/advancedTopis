import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'specialization.dart';


part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  num? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  num? appointPrice;
  String? startTime;
  String? endTime;

  Doctor({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return _$DoctorFromJson(json);
  }
}
