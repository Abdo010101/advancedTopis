import 'dart:math';

import 'package:development/core/netwoking/api_result.dart';
import 'package:development/features/login/data/models/login_request_body.dart';
import 'package:development/features/login/data/repos/login_repo.dart';
import 'package:development/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  //*** Handle Error Message From Api  *******/

  dynamic errorMessages = {};

  ///*************************************** */
  /*** controller of login screen  */
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
//*******  Password Valdation Ruesl{one number , one Capital letter, one small Letter ,has min length ,has Special letter} */

  bool hasOneNumber = false;
  bool hasUpperlLetter = false;
  bool hasMinLength = false;
  bool hasSpecialLetter = false;
  bool hasSmallLetter = false;

  ///*********************************************************************************************** */
  // first funciton
  void userLogin({required LoginRequestBody loginRequestBody}) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody: loginRequestBody);

    response.when(success: (loginRespone) {
      emit(LoginState.success(loginRespone));
    }, failure: (error) {
      error.apiErrorModel.data.forEach((key, value) {
        errorMessages[key] = value.toString(); // Convert all values to String
      });

      print(errorMessages);

      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
