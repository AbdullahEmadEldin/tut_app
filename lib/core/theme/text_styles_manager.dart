// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';

class AppTextThemes {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: getSemiBoldStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.s16,
    ),
    headlineLarge: getSemiBoldStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.s16,
    ),
    headlineMedium: getRegularStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.s14,
    ),
    titleMedium: getMediumStyle(
      color: AppColors.primary,
      fontSize: AppFontSize.s16,
    ),
    titleSmall: getRegularStyle(
      color: AppColors.white,
      fontSize: AppFontSize.s16,
    ),
    bodyLarge: getRegularStyle(color: AppColors.grey1),
    bodySmall: getRegularStyle(color: AppColors.grey),
    bodyMedium: getRegularStyle(
      color: AppColors.grey2,
      fontSize: AppFontSize.s12,
    ),
    labelSmall: getBoldStyle(
      color: AppColors.primary,
      fontSize: AppFontSize.s12,
    ),
  );

//!! Dark theme !!!

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: getSemiBoldStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.s16,
    ),
    headlineLarge: getSemiBoldStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.s16,
    ),
    headlineMedium: getRegularStyle(
      color: AppColors.darkGrey,
      fontSize: AppFontSize.s14,
    ),
    titleMedium: getMediumStyle(
      color: AppColors.primary,
      fontSize: AppFontSize.s16,
    ),
    titleSmall: getRegularStyle(
      color: AppColors.white,
      fontSize: AppFontSize.s16,
    ),
    bodyLarge: getRegularStyle(color: AppColors.grey1),
    bodySmall: getRegularStyle(color: AppColors.grey),
    bodyMedium: getRegularStyle(
      color: AppColors.grey2,
      fontSize: AppFontSize.s12,
    ),
    labelSmall: getBoldStyle(
      color: AppColors.primary,
      fontSize: AppFontSize.s12,
    ),
  );
}

/// *******************************************************
/// This methods to make calling text styles more easier
/// And determine the needed properties in TextStyle.
/// *******************************************************
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: AppFonts.montserrat,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, AppFontWeight.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, AppFontWeight.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, AppFontWeight.light, color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, AppFontWeight.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, AppFontWeight.semiBold, color);
}
