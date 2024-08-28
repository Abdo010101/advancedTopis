import 'package:freezed_annotation/freezed_annotation.dart';

import 'governrate.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  num? id;
  String? name;
  Governrate? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) {
    return _$CityFromJson(json);
  }
}
