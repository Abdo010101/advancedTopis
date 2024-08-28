import 'package:development/core/netwoking/api_error_handler.dart';
import 'package:development/core/netwoking/api_result.dart';
import 'package:development/features/home/data/api/home_api_serviec.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_response.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  // singleTone pattern need to the children must not be null so we can not do that
  //HomeRepo({this._homeApiService});

  Future<ApiResult<SpecialestResponse>> getAllDoctorsSpecialiests() async {
    try {
      final response = await _homeApiService.getAllSpecialization();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
