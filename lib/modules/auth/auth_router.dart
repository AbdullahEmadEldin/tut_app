import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/modules/auth/data/repository/auth_repository.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/auth/view/pages/register_page.dart';
import 'package:tut_app/modules/auth/view_model/login_cubit/login_cubit.dart';
import 'package:tut_app/modules/auth/view_model/register/register_cubit.dart';
import 'package:tut_app/constants/constants.dart';

class AuthRouter {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return PageRouteBuilder(
          transitionDuration: AppConstants.transitionDurationInSec,
          transitionsBuilder: _authPagesAnimationBuilder,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => LoginCubit(
              authService: AuthService(),
            ),
            child: const LoginPage(),
          ),
        );
      case RegisterPage.routeName:
        return PageRouteBuilder(
            transitionDuration: AppConstants.transitionDurationInSec,
            transitionsBuilder: _authPagesAnimationBuilder,
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) => RegisterCubit(
                    authService: AuthService(),
                  ),
                  child: const RegisterPage(),
                ));
      default:
        return null;
    }
  }

  static Widget _authPagesAnimationBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
      reverseCurve: Curves.bounceInOut,
    );
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
}
