import 'dart:io';

import 'package:development/core/helpers/cache_helper.dart';
import 'package:development/core/helpers/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  // if we put ///  3 slash this mean docment comment
  /// private constructor as I don't want to allow creating an instance of this class
  /// this based on singlePattern
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static void addDioHeaders() async {
    // this not allwed to save token as we doing
    dio?.options.headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          'Bearer ${await CacheHelper.getString(SharredKeys.userToken)}',
      // HttpHeaders.contentTypeHeader :"application/json"
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }
}
