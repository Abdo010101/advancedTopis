import 'package:development/core/netwoking/api_error_handler.dart';
import 'package:development/core/netwoking/api_result.dart';
import 'package:development/core/netwoking/api_service.dart';
import 'package:development/features/signUp/data/models/signUp_request_model.dart';
import 'package:development/features/signUp/data/models/sign_up_model/sign_up_model.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignUpModel>> signUp(
      {required SignUpRequestModel signUpRequestModel}) async {
    try {
      final response = await _apiService.signUp(signUpRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
