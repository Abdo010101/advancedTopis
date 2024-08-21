import 'package:development/core/netwoking/api_error_handler.dart';
import 'package:development/core/netwoking/api_result.dart';
import 'package:development/core/netwoking/api_service.dart';
import 'package:development/features/login/data/models/login_request_body.dart';
import 'package:development/features/login/data/models/login_response/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody loginRequestBody}) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
