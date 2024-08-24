import 'package:development/features/signUp/data/models/signUp_request_model.dart';
import 'package:development/features/signUp/data/repos/signUp_repo.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(SignUpState.intial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emaiController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isObscurePassword = false;
  bool isObscureConfirmPassword = false;

  void passwordToggleVisibilty() {
    isObscurePassword = !isObscurePassword;
    emit(SignUpState.chnagePasswordVisiblity());
  }

  void confirmPasswordToggleVisibilty() {
    isObscureConfirmPassword = !isObscureConfirmPassword;
  }

  ///**** When User Sign up Funcito **************** *///
  dynamic errorMessage = {};
  void doSignUp() async {
    emit(SignUpState.loading());
    final response = await _signupRepo.signUp(
        signUpRequestModel: SignUpRequestModel(
            email: emaiController.text.trim(),
            name: nameController.text.trim(),
            password: passwordController.text.trim(),
            password_confirmation: confirmPasswordController.text.trim(),
            phone: phoneController.text.trim(),
            gender: 0));

    response.when(success: (signUpResponse) {
      emit(SignUpState.success(signUpResponse));
    }, failure: (Erro) {
      Erro.apiErrorModel.data.forEach((key, value) {
        errorMessage[key] = value;
      });
      print("mesf arer ${errorMessage.toString()}");

      emit(SignUpState.error(
          error: Erro.apiErrorModel.message ?? 'error happen'));
    });
  }
}
