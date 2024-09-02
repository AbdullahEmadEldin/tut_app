import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/core/theme/colors/colors_scheme.dart';

class AppColors {
  static final AppColors _instance = AppColors._internal();
  factory AppColors() => _instance;
  AppColors._internal();

  AppColorScheme _colorScheme =
      CacheHelper.getData(key: AppConstants.sharedPrefKeys.isDark) ?? false
          ? DarkColorScheme()
          : LightColorScheme(); // Default to light theme

  AppColorScheme get colorScheme => _colorScheme;

  void updateTheme(bool isDark) {
    if (isDark) {
      _colorScheme = DarkColorScheme();
    } else {
      _colorScheme = LightColorScheme();
    }
  }
}
