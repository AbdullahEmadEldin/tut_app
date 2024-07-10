import 'package:flutter/material.dart';
import 'package:tut_app/app/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/view/error/error_router.dart';
import 'package:tut_app/view/splash/splash_screen.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case OnBoardingPage.routeName:
        return MaterialPageRoute(builder: (context) => const OnBoardingPage());
      default:
        return MaterialPageRoute(
            //TODO handle no route found page.
            builder: (context) => const ErrorRouter());
    }
  }
}
