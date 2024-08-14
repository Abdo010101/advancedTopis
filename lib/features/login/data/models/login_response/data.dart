import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? token;
  String? username;

  Data({this.token, this.username});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
