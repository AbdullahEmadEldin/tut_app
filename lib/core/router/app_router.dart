import 'package:flutter/material.dart';
import 'package:tut_app/app/auth/auth_router.dart';
import 'package:tut_app/app/auth/view/pages/login_page.dart';
import 'package:tut_app/app/auth/view/pages/register_page.dart';
import 'package:tut_app/app/home/home_router.dart';
import 'package:tut_app/app/home/view/page/home_page.dart';
import 'package:tut_app/app/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/services/errors/error_router.dart';
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
      case LoginPage.routeName || RegisterPage.routeName:
        return AuthRouter.onGenerate(settings);
      case HomePage.routeName:
        return HomeRouter.onGenerate(settings);
      default:
        return MaterialPageRoute(builder: (context) => const ErrorRouter());
    }
  }
}
