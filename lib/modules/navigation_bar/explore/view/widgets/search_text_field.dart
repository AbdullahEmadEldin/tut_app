// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: SearchTextField(),
      ),
    );
  }

  @override
  double get maxExtent => 60.0; // Adjust the height of the search bar
  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(SearchBarDelegate oldDelegate) {
    return true;
  }
}

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryLight.withOpacity(0.1),
      child: Container(
        height: Helper.getResponsiveDimension(context, baseDimension: 75),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: TextField(
            cursorHeight:
                Helper.getResponsiveDimension(context, baseDimension: 25),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                hintText: AppStrings.searchLabel,
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.grey),
                suffixIcon: Icon(CupertinoIcons.search, color: AppColors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 16,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 32,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                  borderSide: BorderSide(color: AppColors.darkGrey),
                )),
          ),
        ),
      ),
    );
  }
}
