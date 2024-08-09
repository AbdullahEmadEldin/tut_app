import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/book_details_header.dart';

class BookDetailsArgs {
  final Book book;

  BookDetailsArgs({required this.book});
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
              pinned: true, delegate: BookDetailsHeader(book: args.book)),
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

  ClipRRect _bookDetailsBuilder(BuildContext context) {
    return ClipRRect(
      // this ClipRRect to apply the border radius
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: UiHelper.getResponsiveDimension(context, baseDimension: 195),
        width: UiHelper.getResponsiveDimension(context, baseDimension: 227),
        color: Colors.black.withOpacity(0.3),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.book.bookInfo.title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    AppStrings.author +
                        UiHelper.limitStringLength(
                            str: args.book.bookInfo.authors!.first
                                .toString()
                                .toLowerCase(),
                            maxLength: 15),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    AppStrings.published + args.book.bookInfo.publishedDate!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    AppStrings.price +
                        (args.book.saleInfo.listPrice!.amount.toString() == '0'
                            ? ''
                            : args.book.saleInfo.listPrice!.amount.toString()) +
                        args.book.saleInfo.listPrice!.currencyCode!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
