import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/modules/navigation_bar/library/view_model/cubit/get_saved_books_cubit.dart';
import 'package:tut_app/modules/navigation_bar/library/view_model/cubit/set_books_to_lib_cubit.dart';
import 'package:tut_app/shared/view/pages/book_details_page.dart';

class NavBarRouter {
  static final _savedBooksCubit = GetSavedBooksCubit();
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      // inside it there is it's own navigation.
      case AnimatedBottomBar.routeName:
        return PageRouteBuilder(
          transitionDuration: AppConstants.transitionDurationInSec,
          transitionsBuilder: _navBarAnimationBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BlocProvider.value(
            value: _savedBooksCubit,
            child: const AnimatedBottomBar(),
          ),
        );
      case BookDetailsPage.routeName:
        final args = settings.arguments as BookDetailsArgs;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => SetBooksToLibCubit(),
                    ),
                    BlocProvider.value(
                      value: _savedBooksCubit,
                    ),
                  ],
                  child: BookDetailsPage(args: args),
                ));
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
