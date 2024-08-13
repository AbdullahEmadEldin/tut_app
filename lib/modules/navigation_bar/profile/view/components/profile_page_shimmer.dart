import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.background,
      highlightColor: AppColors.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height:
                UiHelper.getResponsiveDimension(context, baseDimension: 135),
            width: UiHelper.getResponsiveDimension(context, baseDimension: 135),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(64), color: Colors.red),
          ),
        ],
      ),
    );
  }
}
