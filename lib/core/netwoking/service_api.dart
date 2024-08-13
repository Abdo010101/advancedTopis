import 'package:development/core/netwoking/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'service_api.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = ApiServiceImp;
}
