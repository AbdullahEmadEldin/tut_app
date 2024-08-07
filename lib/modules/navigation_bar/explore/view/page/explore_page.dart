// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/books_grid_view.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/categories_list_view.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/search_text_field.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      /// CustomScrollView is a scrollable list of slivers.
      /// enables to make custom scrollable behaviors for slivers(widgets)
      /// We need it here to make the search bar sticky at the top.
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchBarDelegate(),
          ),

          /// child of CustomScrollView must be a Sliver type so we can use SliverToBoxAdapter
          /// to make a non-sliver widget a sliver
          SliverToBoxAdapter(
            child: CategoriesListView(),
          ),
          BooksStaggeredGridView(
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}
