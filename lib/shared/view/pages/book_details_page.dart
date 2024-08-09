import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/book_details_header.dart';

class BookDetailsArgs {
  final Book book;
  final int index;
  BookDetailsArgs({required this.book, required this.index});
}

class BookDetailsPage extends StatelessWidget {
  static const String routeName =
      "${AnimatedBottomBar.routeName}/book_details_page";

  final BookDetailsArgs args;
  const BookDetailsPage({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: BookDetailsHeader(book: args.book, index: args.index)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                args.book.bookInfo.description ?? AppStrings.notApplicable,
              ),
            ),
          )
        ],
      ),
    );
  }
}
