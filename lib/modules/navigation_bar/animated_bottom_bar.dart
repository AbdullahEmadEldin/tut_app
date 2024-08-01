import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/home/view/page/home_page.dart';
import 'package:tut_app/modules/navigation_bar/library/pages/library_page.dart';
import 'package:tut_app/modules/navigation_bar/profile/pages/profile_page.dart';

class AnimatedBottomBar extends StatefulWidget {
  static const String routeName = '/nav_bar';
  const AnimatedBottomBar({
    super.key,
  });

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    LibraryPage(),
    ProfilePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: AppColors.secondary.withOpacity(0.2),
        unselectedItemColor: AppColors.darkGrey,
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
          _pageController.jumpToPage(i);
        },
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
      ),
    );
  }

  TextStyle _barItemTextStyle() {
    return Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(fontWeight: FontWeight.bold);
  }
}
