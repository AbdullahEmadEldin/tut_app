import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/modules/onBoarding/view/pages/on_boarding.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  Timer? _timer;
  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

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
      print('inital Router ===> ONBOARDING');
      Navigator.of(context).pushReplacementNamed(OnBoardingPage.routeName);
    } else {
      final bool stayLoggedIn =
          CacheHelper.getData(key: AppConstants.sharedPrefKeys.stayLoggedIn) ??
              false;
      if (stayLoggedIn) {
        Navigator.of(context).pushReplacementNamed(AnimatedBottomBar.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.images.logo,
              height:
                  UiHelper.getResponsiveDimension(context, baseDimension: 150),
              width:
                  UiHelper.getResponsiveDimension(context, baseDimension: 150),
            ),
            AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context, child) => SlideTransition(
                position: slidingAnimation,
                child: Text('Books-Hub',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: AppColors().colorScheme.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    _timer!.cancel();
    super.dispose();
  }
}
