import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class BookTileShimmer extends StatelessWidget {
  final double? imageHeight;
  final double? imageWidth;
  final Color? shimmerColor;
  final bool inStaggeredView;

  /// This is loading shimmer widget for book tile
  /// It represents the loading state. with the same layout of book tile
  const BookTileShimmer({
    super.key,
    this.imageHeight,
    this.imageWidth,
    this.shimmerColor,
    this.inStaggeredView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.background,
      highlightColor: shimmerColor ?? AppColors.secondary,
      child: Padding(
        padding: inStaggeredView
            ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SizedBox(
          width: imageWidth ??
              Helper.getResponsiveDimension(context, baseDimension: 230),
          height: imageHeight ??
              Helper.getResponsiveDimension(context, baseDimension: 362),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.background,
                ),
                width: imageWidth ??
                    Helper.getResponsiveDimension(context, baseDimension: 230),
                height: imageHeight ??
                    Helper.getResponsiveDimension(context, baseDimension: 340),
              ),
              if (!inStaggeredView)
                SizedBox(
                  height:
                      Helper.getResponsiveDimension(context, baseDimension: 12),
                ),
              if (!inStaggeredView)
                Container(
                  height:
                      Helper.getResponsiveDimension(context, baseDimension: 18),
                  width: double.infinity,
                  color: AppColors.primaryGrade4,
                )
            ],
          ),
        ),
      ),
    );
  }
}
