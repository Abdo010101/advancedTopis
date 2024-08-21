import 'package:development/core/netwoking/api_service.dart';
import 'package:development/core/netwoking/dio_factory.dart';
import 'package:development/features/login/data/repos/login_repo.dart';
import 'package:development/features/login/logic/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login di 
  getIt.registerLazySingleton<LoginRepo>(()=>LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(()=>LoginCubit(getIt()));

}
