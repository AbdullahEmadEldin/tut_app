import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/core/assets_paths.dart';
import 'package:tut_app/core/constants.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/services/cache/cache_helper.dart';

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
    _timer = Timer(
        const Duration(seconds: AppConstants.splashTimer), _handleInitialRoute);
  }

  /// Handles the initial route by getting the firstLaunch bool
  /// from the shared preferences and navigating to either OnBoardingPage or LoginPage
  ///
  _handleInitialRoute() async {
    // If it null value, it means it's the first time the user runs the app.
    final bool firstLaunch =
        CacheHelper.getData(key: AppConstants.sharedPrefKeys.firstLaunch) ??
            true;
    if (firstLaunch) {
      Navigator.of(context).pushReplacementNamed(OnBoardingPage.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }
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
