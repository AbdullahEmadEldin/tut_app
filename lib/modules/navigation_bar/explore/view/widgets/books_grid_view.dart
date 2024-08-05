import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/book_sub_models.dart';
import 'package:tut_app/shared/view/widgets/book_tile.dart';

class BooksStaggeredGridView extends StatelessWidget {
  const BooksStaggeredGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 3,

      // physics: NeverScrollableScrollPhysics(),
      // gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3),
      // itemCount: _getBooks().length,
      itemBuilder: (context, index) {
        return BookTile(
          book: _getBooks()[index].bookInfo,
          imageHeight: (index % 5 * 6) + 200,
          inStaggeredView: true,
        );
      },
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
