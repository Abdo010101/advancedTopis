import 'package:development/core/routing/routes.dart';
import 'package:development/features/login/ui/login_screen.dart';
import 'package:development/features/onBoarding/ui/onBoarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No Route define for ${settings.name}')),
                ));
    }
  }
}
