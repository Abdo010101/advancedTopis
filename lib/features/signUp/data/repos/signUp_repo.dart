import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:development/core/netwoking/api_error_handler.dart';
import 'package:development/core/netwoking/api_result.dart';
import 'package:development/core/netwoking/api_service.dart';
import 'package:development/features/signUp/data/models/signUp_request_model.dart';
import 'package:development/features/signUp/data/models/sign_up_model/sign_up_model.dart';
import 'package:development/features/signUp/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupRepo {
  final ApiService _apiService;

  final SharedPreferences pref;
  SignupRepo(this._apiService, this.pref);

  Future<ApiResult<SignUpModel>> signUp(
      {required SignUpRequestModel signUpRequestModel}) async {
    try {
      final response = await _apiService.signUp(signUpRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }


 //***** this exmple for caching the data into sharred pref and USing internectConnectivityCheeker ***** */
  // this is unreal funciton to get the data from api if there is internet get data else get form chced
  Future<ApiResult<UserData>> fetchData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        // asume the api return String
        var response = await _apiService.getUserData();
        //* jsonEncode return map int string json
        String responseAsString = jsonEncode(response.toJson());
        await pref.setString('cachedData', responseAsString);
        return ApiResult.success(response);
      } catch (e) {
        return cachedData();
      }
    } else {
      return cachedData();
    }
  }

  ApiResult<UserData> cachedData() {
    String? responseAsSetring = pref.getString('cachedData');
    if (responseAsSetring != null) {
      //* jsonDecode return String as map<String ,dynamic>
      var res = UserData.fromJson(jsonDecode(responseAsSetring));
      return ApiResult.success(res);
    } else {
      throw Exception('No user cached');
    }
  }


  ///*************************** End of Exmple ********************************************************* */
}
