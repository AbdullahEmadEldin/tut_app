import 'package:flutter/material.dart';
import 'package:tut_app/app/onBoarding/view/widget/on_boarding_bottom_sheet.dart';
import 'package:tut_app/app/onBoarding/view/widget/on_boarding_page_view.dart';
import 'package:tut_app/app/onBoarding/view_model/on_boarding_view_model.dart';
import 'package:tut_app/core/constants.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

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
                milliseconds: AppConstants.onBoardingAnimationTimer),
            curve: Curves.easeInOut,
          );
        },
        onBackFunction: () {
          _pageController.animateToPage(
            onBoardingViewModel.goBack(),
            duration: const Duration(
                milliseconds: AppConstants.onBoardingAnimationTimer),
            curve: Curves.easeInOut,
          );
          print(
              '==>>> ${onBoardingViewModel.currentIndex == onBoardingViewModel.getOnBoardingObjects().length - 1}');
        },
        onSkipFunction: () {},
      ),
    );
  }
}
