import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/core/assets_paths.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/home/data/model/banner_model.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CarouselSlider(
        items: _getBannersItems()
            .map(
              (banner) => Material(
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO Add navigation
                    },
                    child: Image.asset(
                      banner.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
            )
            .toList(),
        options: CarouselOptions(
          height: 190,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
      ),
    );
  }

  List<BannerAd> _getBannersItems() => [
        BannerAd(imageUrl: AppAssets.images.mockBanner1),
        BannerAd(imageUrl: AppAssets.images.mockBanner2),
        BannerAd(imageUrl: AppAssets.images.mockBanner3),
        BannerAd(imageUrl: AppAssets.images.mockBanner4),
      ];
}
