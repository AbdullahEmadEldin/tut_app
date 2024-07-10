import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class OnBoardingPage extends StatelessWidget {
  static const String routeName = '/on_boarding';
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
    );
  }
}
