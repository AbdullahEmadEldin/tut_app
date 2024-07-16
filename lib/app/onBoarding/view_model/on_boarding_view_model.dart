import 'package:tut_app/app/onBoarding/model/on_boarding_model.dart';
import 'package:tut_app/core/app_strings.dart';
import 'package:tut_app/core/assets_paths.dart';

class OnBoardingViewModel {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  List<OnBoardingObject> getOnBoardingObjects() => [
        OnBoardingObject(
            title: AppString.onBoardingTitle1,
            body: AppString.onBoardingSubTitle1,
            image: ImagesAssets.onboardingLogo1),
        OnBoardingObject(
          title: AppString.onBoardingTitle2,
          body: AppString.onBoardingSubTitle2,
          image: ImagesAssets.onboardingLogo2,
        ),
        OnBoardingObject(
          title: AppString.onBoardingTitle3,
          body: AppString.onBoardingSubTitle3,
          image: ImagesAssets.onboardingLogo3,
        ),
        OnBoardingObject(
          title: AppString.onBoardingTitle4,
          body: AppString.onBoardingSubTitle4,
          image: ImagesAssets.onboardingLogo4,
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
