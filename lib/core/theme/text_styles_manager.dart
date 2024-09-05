// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_app/core/lang_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';

class AppTextThemes {
  static TextTheme lightTextTheme(BuildContext context) => TextTheme(
        displayLarge: getSemiBoldStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 40),
        ),
        displayMedium: getSemiBoldStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 36),
        ),
        headlineLarge: getSemiBoldStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 32),
        ),
        headlineMedium: getRegularStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 28),
        ),
        titleMedium: getMediumStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 26),
        ),
        titleSmall: getRegularStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 24),
        ),
        bodyLarge: getRegularStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 20),
        ),
        bodyMedium: getRegularStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 18),
        ),
        bodySmall: getRegularStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 16),
        ),
        labelLarge: getBoldStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 14),
        ),
        labelSmall: getBoldStyle(
          context,
          color: AppColors().colorScheme.primary,
          fontSize: UiHelper.getResponsiveDimension(context, baseDimension: 12),
        ),
      );

//!! Dark theme !!!
}

/// *******************************************************
/// This methods to make calling text styles more easier
/// And determine the needed properties in TextStyle.
/// *******************************************************
TextStyle _getTextStyle(
    BuildContext context, double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: context.locale.languageCode == LanguageType.arabic.code
          ? AppFonts.notoKufiArabic
          : AppFonts.montserrat,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
  BuildContext context, {
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    context,
    fontSize.sp,
    AppFontWeight.regular,
    color,
  );
}

// medium style

TextStyle getMediumStyle(
  BuildContext context, {
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    context,
    fontSize,
    AppFontWeight.medium,
    color,
  );
}

// medium style

TextStyle getLightStyle(
  BuildContext context, {
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    context,
    fontSize,
    AppFontWeight.light,
    color,
  );
}

// bold style

TextStyle getBoldStyle(
  BuildContext context, {
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(context, fontSize, AppFontWeight.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
  BuildContext context, {
  double fontSize = AppFontSize.s12,
  required Color color,
}) {
  return _getTextStyle(context, fontSize, AppFontWeight.semiBold, color);
}
