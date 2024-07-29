import 'package:flutter/material.dart';
import 'package:tut_app/app/home/view/page/home_page.dart';
import 'package:tut_app/core/constants.dart';

class HomeRouter {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return PageRouteBuilder(
            transitionDuration: AppConstants.transitionDurationInSec,
            transitionsBuilder: _homePagesAnimationBuilder,
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage());
      default:
        return null;
    }
  }

  static Widget _homePagesAnimationBuilder(
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
