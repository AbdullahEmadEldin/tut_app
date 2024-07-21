import 'package:flutter/material.dart';
import 'package:tut_app/app/auth/view/pages/login_page.dart';
import 'package:tut_app/app/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/data/errors/error_router.dart';
import 'package:tut_app/view/pages/splash_screen.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case OnBoardingPage.routeName:
        return MaterialPageRoute(builder: (context) => const OnBoardingPage());
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const ErrorRouter());
    }
  }
}
