import 'package:flutter/material.dart';

/// This is an interface for color scheme used everywhere in the app
/// for light and dark mode which they are implemented in LightColorScheme and DarkColorScheme
/// ==> This solution comes to prevent code duplication and over user of conditions over the app
abstract class AppColorScheme {
  Color get background;
  Color get primary;
  Color get lightPrimary;
  Color get secondary;
  Color get secondaryLight;
  Color get primaryGrade4;
  Color get greyPrimary;
  Color get spotColor;
  Color get grey;
  Color get error;
  Color get success;
  Color get darkGrey;
  Color get black;
  Color get white;
  Color get darkPrimary;
  Color get grey2;
}

class LightColorScheme implements AppColorScheme {
  @override
  Color get background => const Color(0xffFFF4E9);
  @override
  Color get primary => const Color(0xff2F4858);
  @override
  Color get lightPrimary => const Color(0xff4B6A70);
  @override
  Color get secondary => const Color(0xff728C86);
  @override
  Color get secondaryLight => const Color(0xff728C86).withOpacity(0.2);
  @override
  Color get primaryGrade4 => const Color(0xffA0AEA0);
  @override
  Color get greyPrimary => const Color(0xffD0D0C1);
  @override
  Color get spotColor => const Color(0xff2C685F);
  @override
  Color get grey => const Color(0xffafafaf);
  @override
  Color get error => const Color.fromARGB(255, 234, 33, 33);
  @override
  Color get success => const Color(0xff2ECC71);
  @override
  Color get darkGrey => const Color(0xff737477);
  @override
  Color get black => const Color(0xff000000);
  @override
  Color get white => const Color(0xffFFFFFF);
  @override
  Color get darkPrimary => const Color(0xffd17d11);
  @override
  Color get grey2 => const Color(0xff797979);
}

class DarkColorScheme implements AppColorScheme {
  @override
  Color get background => const Color(0xff0F2027).withOpacity(0.5);
  @override
  Color get primary => Color.fromARGB(255, 102, 125, 139);
  @override
  Color get lightPrimary => const Color(0xff4B6A70);
  @override
  Color get secondary => const Color(0xff728C86);
  @override
  Color get secondaryLight => Color.fromARGB(255, 19, 39, 48);
  @override
  Color get primaryGrade4 => Color.fromARGB(255, 24, 65, 83);
  @override
  Color get greyPrimary => const Color(0xffD0D0C1);
  @override
  Color get spotColor => Color.fromARGB(255, 51, 106, 143);
  @override
  Color get grey => const Color(0xffafafaf);
  @override
  Color get error => const Color.fromARGB(255, 234, 33, 33);
  @override
  Color get success => const Color(0xff2ECC71);
  @override
  Color get darkGrey => const Color(0xff737477);
  @override
  Color get black => const Color(0xff000000);
  @override
  Color get white => const Color(0xffFFFFFF);
  @override
  Color get darkPrimary => const Color(0xffd17d11);
  @override
  Color get grey2 => const Color(0xff797979);
}
