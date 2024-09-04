import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';

class PopularText extends StatelessWidget {
  const PopularText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        AppStrings.popular.tr(),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontFamily: context.locale.languageCode == 'ar'
                  ? AppFonts.notoKufiArabic
                  : AppFonts.brittanySignature,
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}
