import 'package:easy_localization/easy_localization.dart';
import 'package:tut_app/modules/onBoarding/model/on_boarding_model.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/constants/assets_paths.dart';

class OnBoardingViewModel {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  List<OnBoardingObject> getOnBoardingObjects() => [
        OnBoardingObject(
            title: AppStrings.onBoardingTitle1.tr(),
            body: AppStrings.onBoardingSubTitle1.tr(),
            image: AppAssets.images.onboardingLogo1),
        OnBoardingObject(
          title: AppStrings.onBoardingTitle2.tr(),
          body: AppStrings.onBoardingSubTitle2.tr(),
          image: AppAssets.images.onboardingLogo2,
        ),
        OnBoardingObject(
          title: AppStrings.onBoardingTitle3.tr(),
          body: AppStrings.onBoardingSubTitle3.tr(),
          image: AppAssets.images.onboardingLogo3,
        ),
        OnBoardingObject(
          title: AppStrings.onBoardingTitle4.tr(),
          body: AppStrings.onBoardingSubTitle4.tr(),
          image: AppAssets.images.onboardingLogo4,
        ),
      ];

  void onPageChanged(int index) {
    _currentIndex = index;
  }

  int goNext() {
    if (_currentIndex != getOnBoardingObjects().length - 1) {
      _currentIndex++;
    }
    return _currentIndex;
  }

  int goBack() {
    if (_currentIndex != 0) {
      _currentIndex--;
    }
    return _currentIndex;
  }
}
