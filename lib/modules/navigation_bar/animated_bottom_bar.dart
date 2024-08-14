import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/core/services/networking/dio_comsumer.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/auth/data/repository/auth_repository.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/page/explore_page.dart';
import 'package:tut_app/modules/navigation_bar/explore/view_model/cubit/explore_books_cubit.dart';
import 'package:tut_app/modules/navigation_bar/home/view/page/home_page.dart';
import 'package:tut_app/modules/navigation_bar/home/view_model/get_new_books_cubit.dart';
import 'package:tut_app/modules/navigation_bar/library/pages/library_page.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/repository/profile_repository.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/pages/profile_page.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/cubit/edit_user_data_cubit.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/logout/logout_cubit.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/user_data_cubit/get_user_data_cubit.dart';
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
          api: DioConsumer(),
        ),
      ),
      child: const HomePage(),
    ),
    LibraryPage(),
    BlocProvider(
      create: (context) => ExploreBooksCubit(
        BooksRepository(
          api: DioConsumer(),
        ),
      ),
      child: const ExplorePage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserDataCubit(
            profileRepository: ProfileRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => LogoutCubit(auth: AuthService()),
        ),
        BlocProvider(
          create: (context) => EditUserDataCubit(
            profileRepository: ProfileRepository(),
          ),
        ),
      ],
      child: const ProfilePage(),
    ),
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
              size: UiHelper.getResponsiveDimension(context, baseDimension: 38),
            ),
            title: Text(
              AppStrings.reading.tr(),
              style: _barItemTextStyle(),
            ),
            selectedColor: AppColors.spotColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.bookBookmark,
              size: UiHelper.getResponsiveDimension(context, baseDimension: 30),
            ),
            title: Text(
              AppStrings.library.tr(),
              style: _barItemTextStyle(),
            ),
            selectedColor: AppColors.spotColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              CupertinoIcons.compass,
              size: UiHelper.getResponsiveDimension(context, baseDimension: 38),
            ),
            title: Text(
              AppStrings.explore.tr(),
              style: _barItemTextStyle(),
            ),
            selectedColor: AppColors.spotColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
              size: UiHelper.getResponsiveDimension(context, baseDimension: 38),
            ),
            title: Text(
              AppStrings.profile.tr(),
              style: _barItemTextStyle(),
            ),
            selectedColor: AppColors.spotColor,
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
