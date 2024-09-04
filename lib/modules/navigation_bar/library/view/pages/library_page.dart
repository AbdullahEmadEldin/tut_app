// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/core/theme/theme_manager.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/empty_books_grid.dart';
import 'package:tut_app/modules/navigation_bar/library/view/components/saved_books_grid_view.dart';
import 'package:tut_app/modules/navigation_bar/library/view_model/cubit/get_saved_books_cubit.dart';

class LibraryPage extends StatefulWidget {
  static const String routeName = '/library';
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool saved = true;
  bool downloaded = false;
  @override
  void initState() {
    BlocProvider.of<GetSavedBooksCubit>(context).getSavedBooks();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppThemes.instance.themeNotifier.value == ThemeMode.dark
                ? AppColors().colorScheme.background
                : AppColors().colorScheme.primary,
        title: Text(AppStrings.lib.tr(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColors().colorScheme.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            labelColor: AppColors().colorScheme.primary,
            padding: EdgeInsets.all(8),
            indicatorWeight: 6,
            indicatorColor: AppColors().colorScheme.primary,
            controller: tabController,
            tabs: [
              Text(AppStrings.saved.tr()),
              Text(AppStrings.downloaded.tr()),
            ],
            onTap: (selectedIndex) {
              if (selectedIndex == 0) {
                saved = true;
                downloaded = false;
              } else if (selectedIndex == 1) {
                saved = false;
                downloaded = true;
              }
              setState(() {});
            },
          ),
          if (saved) SavedBooksGridView(),
          if (downloaded)
            EmptyBooksGrid(
              message: 'Google books uses DRM-protected books',
            )
        ],
      ),
    );
  }
}
