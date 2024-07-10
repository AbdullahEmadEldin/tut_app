import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tut_app/app/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/core/assets_paths.dart';
import 'package:tut_app/core/constants.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Timer? _timer;
  @override
  void initState() {
    super.initState();

    /// AnimationController for the rotation animation of the logo.
    _controller = AnimationController(
      duration: const Duration(
          seconds: AppConstants.splashTimer), // Set the duration here
      vsync: this,
    )..repeat(); // Repeats the animation indefinitely

    /// Timer for navigating to the next screen after duration.
    _timer = Timer(const Duration(seconds: AppConstants.splashTimer), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacementNamed(OnBoardingPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: RotationTransition(
        turns: _controller!,
        child: Center(
          child: Image.asset(ImagesAssets.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    _timer!.cancel();
    super.dispose();
  }
}
