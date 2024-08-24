import 'package:development/core/netwoking/api_constant.dart';
import 'package:development/features/login/data/models/login_request_body.dart';
import 'package:development/features/login/data/models/login_response/login_response.dart';
import 'package:development/features/signUp/data/models/signUp_request_model.dart';
import 'package:development/features/signUp/data/models/sign_up_model/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.apiLogin)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstant.apiSignUp)
 Future<SignUpModel> signUp(
  @Body() SignUpRequestModel signUpRequestModel
 );
}
