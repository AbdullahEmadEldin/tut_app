import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/book_details_header.dart';

class BookDetailsArgs {
  final Book book;
  final String heroTag;
  BookDetailsArgs({required this.book, required this.heroTag});
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
              delegate:
                  BookDetailsHeader(book: args.book, heroTag: args.heroTag)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                args.book.bookInfo.description ?? AppStrings.notApplicable.tr(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
