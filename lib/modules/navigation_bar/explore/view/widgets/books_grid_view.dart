import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/empty_books_grid.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/book_sub_models.dart';
import 'package:tut_app/shared/view/widgets/book_tile.dart';
import 'package:tut_app/shared/view/widgets/book_tile_shimmer.dart';

class BooksStaggeredGridView extends StatelessWidget {
  final List<Book> books;
  final bool isLoading;
  const BooksStaggeredGridView({
    super.key,
    required this.books,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    /// SliverMasonryGrid supports Lazy loading of it's elements So it hasn't builder constructor
    return books.isEmpty
        ? const SliverToBoxAdapter(child: EmptyBooksGrid())
        : SliverMasonryGrid(
            // crossAxisCount: 3,

            //physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),

            //itemCount: _getBooks().length,
            delegate: SliverChildBuilderDelegate(
              childCount: isLoading ? 12 : _getBooks().length,
              (context, index) {
                return isLoading
                    ? BookTileShimmer(
                        inStaggeredView: true,
                        imageHeight: 230,
                        shimmerColor: AppColors.secondaryLight,
                      )
                    : BookTile(
                        book: _getBooks()[index].bookInfo,
                        imageHeight: (index % 5 * 6) + 200,
                        inStaggeredView: true,
                      );
              },
            ),
          );
  }

  List<Book> _getBooks() => [
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "Test 2 for a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
      ];
}
