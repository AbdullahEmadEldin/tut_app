import 'package:flutter/material.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/book_tile.dart';
import 'package:tut_app/shared/view/widgets/book_tile_shimmer.dart';

class BooksListView extends StatelessWidget {
  final List<Book> books;
  final bool isLoading;
  const BooksListView({
    super.key,
    required this.books,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Helper.getResponsiveDimension(context, baseDimension: 410),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: isLoading ? 3 : books.length,
        itemBuilder: (context, index) {
          return isLoading
              ? const BookTileShimmer() //represent the loading state.
              : BookTile(
                  book: books[index].bookInfo,
                );
        },
      ),
    );
  }
}
