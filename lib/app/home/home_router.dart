import 'package:flutter/material.dart';
import 'package:tut_app/app/home/view/page/home_page.dart';

class HomeRouter {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return null;
    }
  }
}
