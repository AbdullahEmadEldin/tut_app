import 'package:flutter/material.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/onBoarding/view/widget/on_boarding_bottom_sheet.dart';
import 'package:tut_app/modules/onBoarding/view/widget/on_boarding_page_view.dart';
import 'package:tut_app/modules/onBoarding/view_model/on_boarding_view_model.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = '/on_boarding';
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel onBoardingViewModel = OnBoardingViewModel();

  @override
  void initState() {
    super.initState();

    /// set the firstLaunch bool with false
    ///
    CacheHelper.saveData(
        key: AppConstants.sharedPrefKeys.firstLaunch, value: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// PageView.builder for viewing onBoarding details
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => setState(() {
          onBoardingViewModel.onPageChanged(index);
        }),
        itemCount: onBoardingViewModel.getOnBoardingObjects().length,
        itemBuilder: (context, index) {
          return OnBoardingPageView(
            onBoardingObject: onBoardingViewModel.getOnBoardingObjects()[index],
          );
        },
      ),

      /// BottomSheet for navigating between pages
      bottomSheet: OnBoardingBottomSheetWidget(
        viewModel: onBoardingViewModel,
        onNextFunction: () {
          _pageController.animateToPage(
            onBoardingViewModel.goNext(),
            duration: const Duration(
                milliseconds: AppConstants.onBoardingAnimationTimerInMilli),
            curve: Curves.easeInOut,
          );
        },
        onBackFunction: () {
          _pageController.animateToPage(
            onBoardingViewModel.goBack(),
            duration: const Duration(
                milliseconds: AppConstants.onBoardingAnimationTimerInMilli),
            curve: Curves.easeInOut,
          );
        },
        onSkipFunction: () {
          Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
        },
      ),
    );
  }
}
