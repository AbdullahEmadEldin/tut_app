import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tut_app/core/app_strings.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class AnimatedBottomBar extends StatefulWidget {
  const AnimatedBottomBar({
    super.key,
  });

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      backgroundColor: AppColors.secondary.withOpacity(0.2),
      unselectedItemColor: AppColors.darkGrey,
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: [
        SalomonBottomBarItem(
          icon: Icon(
            CupertinoIcons.home,
            size: Helper.getResponsiveDimension(context, baseDimension: 38),
          ),
          title: Text(
            AppStrings.reading,
            style: _barItemTextStyle(),
          ),
          selectedColor: AppColors.primary,
        ),
        SalomonBottomBarItem(
          icon: Icon(
            FontAwesomeIcons.bookBookmark,
            size: Helper.getResponsiveDimension(context, baseDimension: 30),
          ),
          title: Text(
            AppStrings.library,
            style: _barItemTextStyle(),
          ),
          selectedColor: AppColors.primary,
        ),
        SalomonBottomBarItem(
          icon: Icon(
            CupertinoIcons.search,
            size: Helper.getResponsiveDimension(context, baseDimension: 38),
          ),
          title: Text(
            AppStrings.search,
            style: _barItemTextStyle(),
          ),
          selectedColor: AppColors.primary,
        ),
        SalomonBottomBarItem(
          icon: Icon(
            CupertinoIcons.profile_circled,
            size: Helper.getResponsiveDimension(context, baseDimension: 38),
          ),
          title: Text(
            AppStrings.profile,
            style: _barItemTextStyle(),
          ),
          selectedColor: AppColors.primary,
        ),
      ],
    );
  }

  TextStyle _barItemTextStyle() {
    return Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(fontWeight: FontWeight.bold);
  }
}
