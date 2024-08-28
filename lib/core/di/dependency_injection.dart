import 'package:development/core/helpers/cache_helper.dart';
import 'package:development/core/netwoking/api_service.dart';
import 'package:development/core/netwoking/dio_factory.dart';
import 'package:development/features/home/data/api/home_api_serviec.dart';
import 'package:development/features/home/data/repos/home_repo.dart';
import 'package:development/features/home/logic/cubit/home_cubit.dart';
import 'package:development/features/login/data/repos/login_repo.dart';
import 'package:development/features/login/logic/login_cubit.dart';
import 'package:development/features/signUp/data/repos/signUp_repo.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  Dio dio = DioFactory.getDio();

  SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(pref);

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login di
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // SignUp di
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt(), getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // Home DI with  service
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
