// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/explore/view_model/cubit/explore_books_cubit.dart';

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
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors().colorScheme.secondaryLight.withOpacity(0.1),
      child: Container(
        height: UiHelper.getResponsiveDimension(context, baseDimension: 75),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: TextField(
            controller: textEditingController,
            onSubmitted: (value) => _makeSearchCall(context),
            cursorHeight:
                UiHelper.getResponsiveDimension(context, baseDimension: 25),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                hintText: AppStrings.searchLabel.tr(),
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors().colorScheme.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    _makeSearchCall(context);
                  },
                  icon: Icon(
                    CupertinoIcons.search_circle_fill,
                    color: AppColors().colorScheme.spotColor.withOpacity(0.9),
                    size: 40,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                  borderSide: BorderSide(color: AppColors().colorScheme.grey),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 16,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                  borderSide: BorderSide(color: AppColors().colorScheme.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 32,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                  borderSide:
                      BorderSide(color: AppColors().colorScheme.darkGrey),
                )),
          ),
        ),
      ),
    );
  }

  void _makeSearchCall(BuildContext context) {
    if (textEditingController.text.isNotEmpty) {
      BlocProvider.of<ExploreBooksCubit>(context)
          .searchForBook(searchItem: textEditingController.text, startIndex: 0);
      BlocProvider.of<ExploreBooksCubit>(context).switchToSearch();
    }
  }
}
