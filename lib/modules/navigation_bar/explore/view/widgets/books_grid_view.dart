import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/empty_books_grid.dart';
import 'package:tut_app/modules/navigation_bar/explore/view_model/cubit/explore_books_cubit.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/book_tile.dart';
import 'package:tut_app/shared/view/widgets/book_tile_shimmer.dart';

/// In This page we are using StaggeredGridView with manual pagination without any packages.
class BooksStaggeredGridView extends StatefulWidget {
  final ScrollController scrollController;
  final bool isLoading;
  const BooksStaggeredGridView({
    super.key,
    required this.scrollController,
    this.isLoading = false,
  });

  @override
  State<BooksStaggeredGridView> createState() => _BooksStaggeredGridViewState();
}

class _BooksStaggeredGridViewState extends State<BooksStaggeredGridView> {
  late ExploreBooksCubit exploreBooksCubit;
  final List<Book> _items = [];
  bool _search = false;
  bool _defaultView = true; // the default is Empty photo.
  int _startIndex = 0;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    exploreBooksCubit = BlocProvider.of<ExploreBooksCubit>(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    widget.scrollController.addListener(() {
      /// Checks if the current scroll position is at the very end of (scroll view) the list.
      if (widget.scrollController.position.pixels ==
                  widget.scrollController.position.maxScrollExtent &&
              _hasMore &&
              !_isLoading // loading means that this trigger is already called so there is no nee to call it again.
          ) {
        if (_search && exploreBooksCubit.getCategory() == null) {
          /// Set the firstSearchCall to false to stop clearing the UI list
          exploreBooksCubit.setFirstSearchCall(false);
          exploreBooksCubit.searchForBook(
              searchItem: exploreBooksCubit.searchItem()!,
              startIndex: _startIndex);
        } else if (_search && exploreBooksCubit.getCategory() != null) {
        } else {
          exploreBooksCubit.getCategorizedBooks(
              category: exploreBooksCubit.getCategory()!,
              lang: 'en',
              startIndex: _startIndex);
        }
      }
    });
  }

  _fetchBooks(List<Book> newBooks) {
    final newItems = newBooks;
    // This from where the new items will be added and the user continue to scroll
    double lastScrollExtent = widget.scrollController.position.pixels;
    try {
      /// if new items from API are not empty it will add them to items list
      if (newItems.isNotEmpty) {
        /// if true it will  reset items list and start index to 0 (clear pagination).
        if (exploreBooksCubit.getNewCategoryBool() ||
            (_search && exploreBooksCubit.firstSearchCall())) {
          print('Hello Fetching ***************************');
          _items.clear();
          _startIndex = 0;
          exploreBooksCubit.newCategory(false);
        }
        _items.addAll(newItems);
        _startIndex += 20;

        /// After items are fetched and UI is already builded the scroll position will jump to this point
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_startIndex > 21)
            widget.scrollController.jumpTo(lastScrollExtent);
        });
      } else {
        /// This means that there is no more data to fetch
        _hasMore = false;
      }
    } on Exception catch (e) {
      print('???? Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// SliverMasonryGrid supports Lazy loading of it's elements So it hasn't builder constructor
    return BlocListener<ExploreBooksCubit, ExploreBooksState>(
      listener: (context, state) {
        if (state is FetchingBooksLoading) {
          setState(() {
            _defaultView = false;
            _isLoading = true;
            _search = false;
          });
        } else if (state is FetchingBooksSuccess) {
          setState(() {
            _defaultView = false;
            _isLoading = false;
            _search = false;
          });
          _fetchBooks(state.books);
        } else if (state is SearchBooksSuccess) {
          setState(() {
            _defaultView = false;
            _isLoading = false;
            _search = true;
          });
          _fetchBooks(state.books);
        } else if (state is FetchingBooksFailure) {
          setState(() {
            _defaultView = false;
            _isLoading = false;
            _search = false;
          });
        } else {
          print('===============${state.toString()}==============xxx=====');
        }
      },
      child: _defaultView
          ? SliverToBoxAdapter(
              child: EmptyBooksGrid(
              message: (_items.isEmpty && _search) ? AppStrings.noBooks : null,
            ))
          : SliverMasonryGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // This condition for replace childCount as  if I set it,
                  // it causes restart the scroll controller to the first items of the list
                  // and cancel implementing logic of lastScrollExtent.
                  //? but WHY (.length +1) to enable show shimmers for only 1 times after the items.
                  if (index > _items.length) return null;
                  return index == _items.length ||
                          exploreBooksCubit.getNewCategoryBool()
                      ? BookTileShimmer(
                          inStaggeredView: true,
                          imageHeight: (index % 5 * 6) + 200,
                          shimmerColor: AppColors.spotColor,
                        )
                      : BookTile(
                          book: _items[index],
                          heroTag: index.toString() + _items[index].id,
                          imageHeight: (index % 5 * 6) +
                              200, // this is to make the image height dynamic
                          inStaggeredView: true,
                        );
                },
              ),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
            ),
    );
  }
}
