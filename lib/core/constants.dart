class AppConstants {
  static SharedPrefKeys sharedPrefKeys = SharedPrefKeys();
  static const int splashTimer = 2;
  static const int onBoardingAnimationTimerInMilli = 1000;
  static const Duration transitionDurationInSec = Duration(seconds: 1);
}

class SharedPrefKeys {
  String lang = 'lang';
  String firstLaunch = 'firstLaunch';
  String stayLoggedIn = 'stayLoggedIn';
}
