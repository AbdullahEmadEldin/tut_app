import 'package:flutter/material.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';

enum LanguageType {
  english('en'),
  arabic('ar');

  final String text;

  const LanguageType(this.text);
}

const String ASSET_PATH_LOCALISATIONS = "assets/translations";

const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");

Future<String> getAppLang() async {
  return await CacheHelper.getData(key: AppConstants.sharedPrefKeys.lang) ??
      LanguageType.english.text;
}
