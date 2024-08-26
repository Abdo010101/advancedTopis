import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserData {
  // here you put the key in the postman if you wwant to change his name here
  // @JsonKey('')
  String name;
  int age;

  UserData({required this.name, required this.age});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
