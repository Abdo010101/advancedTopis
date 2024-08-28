import 'package:development/core/di/dependency_injection.dart';
import 'package:development/core/routing/routes.dart';
import 'package:development/features/home/logic/cubit/home_cubit.dart';
import 'package:development/features/home/ui/home_screen.dart';
import 'package:development/features/login/logic/login_cubit.dart';
import 'package:development/features/login/ui/login_screen.dart';
import 'package:development/features/onBoarding/ui/onBoarding_screen.dart';
import 'package:development/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:development/features/signUp/ui/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<HomeCubit>()..getAllSpecialestDoctors(),
                  child: const HomeScreen(),
                ));
      case Routes.signUp:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));
      default:
        return null;
    }
  }
}
