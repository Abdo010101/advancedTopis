import 'dart:io';

import 'package:development/core/helpers/cache_helper.dart';
import 'package:development/core/helpers/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

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

   
///** File-Based Storage: FileCacheStore stores the cached data in the device's file system. This approach is useful for persisting data across app launches because the data remains 
//** saved in the device's storage until explicitly cleared or when the cache expires.

  //** add Caching Method.*** */
  // static Future<void> addDioCaching() async {
  //   final cacheDir = await path_provider.getTemporaryDirectory();
  //   final cacheStore = FileCacheStore(cacheDir.path);
  //   final options = CacheOptions(
  //     store: cacheStore,
  //     policy: CachePolicy.request,
  //     hitCacheOnErrorExcept: [401, 403],
  //     priority: CachePriority.normal,
  //     maxStale: const Duration(days: 7),
  //   );

  static void addDioHeaders() async {
    // this not allwed to save token as we doing
    dio?.options.headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          'Bearer ${await CacheHelper.getSecuredString(key: SharredKeys.userToken)}',
      // HttpHeaders.contentTypeHeader :"application/json"
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }
}
