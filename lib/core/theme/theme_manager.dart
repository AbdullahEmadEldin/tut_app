import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';
import 'package:tut_app/core/theme/text_styles_manager.dart';
import 'package:tut_app/constants/values_manager.dart';

class AppThemes {
  /// define a singleton instance
  ///
  AppThemes._internal();
  static final instance = AppThemes._internal();

  static ThemeMode? _value;
  ThemeMode? get themeMode => _value;

  updateThemeValue(bool isDark) {
    if (CacheHelper.getData(key: AppConstants.sharedPrefKeys.isDark) != null) {
      _value = CacheHelper.getData(key: AppConstants.sharedPrefKeys.isDark)
          ? ThemeMode.dark
          : ThemeMode.light;
    }
    _value = isDark ? ThemeMode.dark : ThemeMode.light;
    themeNotifier.value = _value;
  }

  final ValueNotifier<ThemeMode?> themeNotifier = ValueNotifier(
      CacheHelper.getData(key: AppConstants.sharedPrefKeys.isDark) ?? false
          ? ThemeMode.dark
          : _value);

  ThemeData lightAppTheme(BuildContext context) => ThemeData(
        // main colors
        primaryColor: AppColors().colorScheme.primary,
        primaryColorLight: AppColors().colorScheme.lightPrimary,
        primaryColorDark: AppColors().colorScheme.darkPrimary,
        disabledColor: AppColors().colorScheme.darkGrey,
        splashColor: AppColors().colorScheme.lightPrimary,
        scaffoldBackgroundColor:
            AppColors().colorScheme.background, // ripple effect color
        // cardview theme
        cardTheme: CardTheme(
          color: AppColors().colorScheme.white,
          shadowColor: AppColors().colorScheme.grey,
          elevation: AppSize.s4,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors().colorScheme.primary,
          elevation: AppSize.s4,
          shadowColor: AppColors().colorScheme.lightPrimary,
        ),
        // elevated button them
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(context,
                color: AppColors().colorScheme.white,
                fontSize: AppFontSize.s17),
            backgroundColor: AppColors().colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
          ),
        ),
        textTheme: AppTextThemes.lightTextTheme(context),
        // input decoration theme (text form field)
        inputDecorationTheme: InputDecorationTheme(
          // content padding
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          // hint style
          hintStyle: getRegularStyle(context,
              color: AppColors().colorScheme.grey, fontSize: 14.sp),
          labelStyle: getMediumStyle(context,
              color: AppColors().colorScheme.grey, fontSize: 14.sp),
          errorStyle:
              getRegularStyle(context, color: AppColors().colorScheme.error),

          // enabled border style
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorScheme.grey, width: AppSize.s0_5),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          ),

          // focused border style
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorScheme.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          ),

          // error border style
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorScheme.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          ),
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorScheme.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          ),
        ),
        // label style
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: AppColors().colorScheme.primary),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors().colorScheme.secondary),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors().colorScheme.primary;
            } else {
              return Colors.transparent;
            }
          }),
          checkColor: WidgetStatePropertyAll(AppColors().colorScheme.white),
          side: BorderSide(color: AppColors().colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s4),
          ),
        ),
      );

  ThemeData darkAppTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: Colors.red, // ripple effect color
        brightness: Brightness.dark,
        textTheme: AppTextThemes.lightTextTheme(context),
      );
}
