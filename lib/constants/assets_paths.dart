class AppAssets {
  static const String translationsPath = "assets/translations";
  static ImagesPaths images = ImagesPaths();
  static AnimationAssets animations = AnimationAssets();
  static IconPath icons = IconPath();
}

class AnimationAssets {
  final String loginAnimation = 'assets/animations/login_animation.riv';
}

class ImagesPaths {
  final String changeLang = 'assets/images/change_lang_ic.svg';
  final String contactUs = 'assets/images/contact_us_ic.svg';
  final String hollowCircle = 'assets/images/hollow_circle_ic.svg';
  final String inviteFriends = 'assets/images/invite_friends_ic.svg';
  final String leftArrow = 'assets/images/left_arrow_ic.svg';
  final String logout = 'assets/images/logout_ic.svg';
  final String onboardingLogo1 = 'assets/images/onboarding_logo1.svg';
  final String onboardingLogo2 = 'assets/images/onboarding_logo2.svg';
  final String onboardingLogo3 = 'assets/images/onboarding_logo3.svg';
  final String onboardingLogo4 = 'assets/images/onboarding_logo4.svg';
  final String photoCamera = 'assets/images/photo-camera.svg';
  final String rightArrow = 'assets/images/right_arrow_ic.svg';
  final String rightArrowSettings = 'assets/images/right_arrow_settings_ic.svg';
  final String splashLogo = 'assets/images/splash_logo.png';
  final String avatar = 'assets/images/avatar.jpg';
  final String emptyBooksSvd = 'assets/images/reading_time.svg';

  final String mockBanner1 = 'assets/images/mock_banner1.png';
  final String mockBanner2 = 'assets/images/mock_banner2.png';
  final String mockBanner3 = 'assets/images/mock_banner3.png';
  final String mockBanner4 = 'assets/images/mock_banner4.png';

  final String nightMode = 'assets/images/dark_theme_moon.png';
  final String lightMode = 'assets/images/light_mode_sun.png';

  final String fakeBookCover = 'assets/images/fake_book_cover.png';

  final String fakeBookCover2 = 'assets/images/fakeCover2.png';
}

/// I'm using icons for enums outside  AppAssets so it's static as enum don't accept another from.
class IconPath {
  static const String fiction = 'assets/images/fiction_icon.png';
  static const String health = 'assets/images/health_icon.png';
  static const String history = 'assets/images/history_icon.png';
  static const String islam = 'assets/images/islam_icon.png';
  static const String child = 'assets/images/child_icon.png';
  static const String novel = 'assets/images/novel_icon.png';
  static const String poetry = 'assets/images/poetry_icon.png';
}
