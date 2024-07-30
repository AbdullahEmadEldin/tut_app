import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';
import 'package:tut_app/core/theme/text_styles_manager.dart';
import 'package:tut_app/core/values_manager.dart';

class AppThemes {
  static ThemeData lightAppTheme = ThemeData(
    // main colors
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.lightPrimary,
    primaryColorDark: AppColors.darkPrimary,
    disabledColor: AppColors.darkGrey,
    splashColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.background, // ripple effect color
    // cardview theme
    cardTheme: CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.primary,
      elevation: AppSize.s4,
      shadowColor: AppColors.lightPrimary,
    ),
    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: AppColors.white, fontSize: AppFontSize.s17),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: AppTextThemes.lightTextTheme,
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      // hint style
      hintStyle:
          getRegularStyle(color: AppColors.grey, fontSize: AppFontSize.s14),
      labelStyle:
          getMediumStyle(color: AppColors.grey, fontSize: AppFontSize.s14),
      errorStyle: getRegularStyle(color: AppColors.error),

      // enabled border style
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey, width: AppSize.s0_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
    // label style
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.primary),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: AppColors.secondary),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        } else {
          return Colors.transparent;
        }
      }),
      checkColor: WidgetStatePropertyAll(AppColors.white),
      side: BorderSide(color: AppColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
    ),
  );

  static ThemeData darkAppTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
