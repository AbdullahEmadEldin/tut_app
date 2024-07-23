import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/app/auth/data/repository/auth_repository.dart';
import 'package:tut_app/app/auth/view/pages/login_page.dart';
import 'package:tut_app/app/auth/view/pages/register_page.dart';
import 'package:tut_app/app/auth/view_model/login_cubit/login_cubit.dart';
import 'package:tut_app/app/auth/view_model/register/register_cubit.dart';
import 'package:tut_app/services/networking/dio_comsumer.dart';

class AuthRouter {
  static Route? onGenerate(RouteSettings settings) {
    final Dio dio = Dio();
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(
              authService: AuthService(
                api: DioConsumer(
                  dio: dio,
                ),
              ),
            ),
            child: const LoginPage(),
          ),
        );
      case RegisterPage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => RegisterCubit(dio: dio),
                  child: const RegisterPage(),
                ));
      default:
        return null;
    }
  }
}
