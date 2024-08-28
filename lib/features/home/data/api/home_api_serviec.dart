import 'package:development/core/netwoking/api_constant.dart';
import 'package:development/core/netwoking/api_result.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_api_serviec.g.dart';

///!Note don't forget to pust the serice in the di
@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  //** get all specialist doctor main api at home screen  */
  @GET(ApiConstant.apiGetSpecialztion)
  Future<SpecialestResponse> getAllSpecialization();
}
