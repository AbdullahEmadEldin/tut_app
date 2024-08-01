import 'package:flutter/material.dart';
import 'package:tut_app/modules/auth/auth_router.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/auth/view/pages/register_page.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/modules/navigation_bar/nav_bar_router.dart';
import 'package:tut_app/modules/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/core/services/errors/error_router.dart';
import 'package:tut_app/modules/splash/splash_screen.dart';

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
      case AnimatedBottomBar.routeName:
        return NavBarRouter.onGenerate(settings);
      default:
        return MaterialPageRoute(builder: (context) => const ErrorRouter());
    }
  }
}
