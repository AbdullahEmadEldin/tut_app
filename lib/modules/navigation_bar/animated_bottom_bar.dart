import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/services/networking/dio_comsumer.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/page/explore_page.dart';
import 'package:tut_app/modules/navigation_bar/explore/view_model/cubit/explore_books_cubit.dart';
import 'package:tut_app/modules/navigation_bar/home/view/page/home_page.dart';
import 'package:tut_app/modules/navigation_bar/home/view_model/get_new_books_cubit.dart';
import 'package:tut_app/modules/navigation_bar/library/pages/library_page.dart';
import 'package:tut_app/modules/navigation_bar/profile/pages/profile_page.dart';
import 'package:tut_app/shared/data/repos/books_repository.dart';

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

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => GetNewBooksCubit(
        repo: BooksRepository(
          api: DioConsumer(
            //todo: define one Dio instance for all pages
            dio: Dio(),
          ),
        ),
      ),
      child: const HomePage(),
    ),
    LibraryPage(),
    BlocProvider(
      create: (context) => ExploreBooksCubit(
        BooksRepository(
          api: DioConsumer(
            dio: Dio(),
          ),
        ),
      ),
      child: const ExplorePage(),
    ),
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
        backgroundColor: AppColors.secondaryLight,
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
              CupertinoIcons.compass,
              size: Helper.getResponsiveDimension(context, baseDimension: 38),
            ),
            title: Text(
              AppStrings.explore,
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
