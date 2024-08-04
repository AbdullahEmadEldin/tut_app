import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/core/services/networking/dio_comsumer.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/shared/data/repos/books_repository.dart';
import 'package:tut_app/modules/navigation_bar/home/view_model/get_books_by_category_cubit.dart';

class NavBarRouter {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AnimatedBottomBar.routeName:
        return PageRouteBuilder(
          transitionDuration: AppConstants.transitionDurationInSec,
          transitionsBuilder: _navBarAnimationBuilder,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => GetBooksByCategoryCubit(
              repo: BooksRepository(
                api: DioConsumer(
                  dio: Dio(),
                ),
              ),
            ),
            child: const AnimatedBottomBar(),
          ),
        );
      default:
        return null;
    }
  }

  static Widget _navBarAnimationBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(-1.0, 0.0);
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
