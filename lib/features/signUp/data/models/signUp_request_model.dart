import 'package:freezed_annotation/freezed_annotation.dart';
part 'signUp_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  String name;
  String email;
  String phone;
  String password;
  String password_confirmation;
  int gender = 0;

  SignUpRequestModel(
      {required this.email,
      required this.name,
      required this.password,
      required this.password_confirmation,
      required this.phone,
      required this.gender});

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
