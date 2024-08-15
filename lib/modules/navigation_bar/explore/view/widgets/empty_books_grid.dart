import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';

class EmptyBooksGrid extends StatelessWidget {
  final String? message;
  const EmptyBooksGrid({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: UiHelper.getResponsiveDimension(context, baseDimension: 410),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.images.emptyBooksSvd,
                height: UiHelper.getResponsiveDimension(context,
                    baseDimension: 320),
              ),
              Text(
                message ?? AppStrings.pickCategory.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors().colorScheme.spotColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
