import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class EmptyBooksGrid extends StatelessWidget {
  const EmptyBooksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: Helper.getResponsiveDimension(context, baseDimension: 410),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.images.emptyBooksSvd,
                height:
                    Helper.getResponsiveDimension(context, baseDimension: 320),
              ),
              Text(
                AppStrings.pickCategory,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.spotColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
