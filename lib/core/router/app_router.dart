import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/app/auth/data/repository/auth_repository.dart';
import 'package:tut_app/app/auth/view/pages/login_page.dart';
import 'package:tut_app/app/auth/view_model/login_cubit/login_cubit.dart';
import 'package:tut_app/app/home/home_router.dart';
import 'package:tut_app/app/home/view/page/home_page.dart';
import 'package:tut_app/app/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/data/errors/error_router.dart';
import 'package:tut_app/data/networking/dio_comsumer.dart';
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
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(
              authService: AuthService(
                api: DioConsumer(
                  dio: Dio(),
                ),
              ),
            ),
            child: const LoginPage(),
          ),
        );
      case HomePage.routeName:
        return HomeRouter.onGenerate(settings);
      default:
        return MaterialPageRoute(builder: (context) => const ErrorRouter());
    }
  }
}
