import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialest_response.g.dart';

@JsonSerializable()
class SpecialestResponse {
  List<SpecialestDoctorModel?>? data;

  SpecialestResponse({this.data});

  factory SpecialestResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecialestResponseFromJson(json);
}
