// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/books_grid_view.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/categories_list_view.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/search_text_field.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      /// CustomScrollView is a scrollable list of slivers.
      /// enables to make custom scrollable behaviors for slivers(widgets)
      /// We need it here to make the search bar sticky at the top.
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchBarDelegate(),
          ),
          SliverToBoxAdapter(
            child: CategoriesListView(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            sliver: BooksStaggeredGridView(),
          ),
        ],
      ),
    );
  }
}
