class AppConstants {
  static SharedPrefKeys sharedPrefKeys = SharedPrefKeys();
  static SqlKeys sqlKeys = SqlKeys();
  static const int splashTimer = 2;
  static const int pageSize = 50;
  static const int onBoardingAnimationTimerInMilli = 1000;
  static const Duration transitionDurationInSec = Duration(seconds: 1);
}

class SharedPrefKeys {
  String lang = 'lang';
  String firstLaunch = 'firstLaunch';
  String stayLoggedIn = 'stayLoggedIn';
  String token = 'token';
  String userId = 'id';
  String isDark = 'isDark';
}

class SqlKeys {
  String savedBooksTable = 'savedBooks';
  String downloadsTable = 'downloads';
  String bookId = 'bookId';
  String bookName = 'bookName';
  String bookImage = 'image';
}
