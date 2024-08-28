import 'package:freezed_annotation/freezed_annotation.dart';

part 'governrate.g.dart';

@JsonSerializable()
class Governrate {
  num? id;
  String? name;

  Governrate({this.id, this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) {
    return _$GovernrateFromJson(json);
  }
}
