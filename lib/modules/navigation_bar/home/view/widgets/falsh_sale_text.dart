import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';

class FlashSaleText extends StatelessWidget {
  const FlashSaleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        AppStrings.flashSale.tr(),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontFamily: AppFonts.brittanySignature,
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}
