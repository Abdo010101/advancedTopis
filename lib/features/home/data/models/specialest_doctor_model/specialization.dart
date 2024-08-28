import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialization.g.dart';

@JsonSerializable()
class Specialization {
  num? id;
  String? name;

  Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return _$SpecializationFromJson(json);
  }
}
