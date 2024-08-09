import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/shared/data/models/book.dart';

class BookDetailsHeader extends SliverPersistentHeaderDelegate {
  final Book book;

  BookDetailsHeader({required this.book});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        ClipRect(
          child: Stack(
            children: [
              /// The background image which will be blurred.
              Image.network(
                book.bookInfo.imageLinks!.thumbnail!,
                fit: BoxFit.fill,
                height: UiHelper.getResponsiveDimension(context,
                    baseDimension: 320),
                width: double.infinity,
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                top: 75,
                start: 22,
                child: Hero(
                  tag: book.id,
                  child: Material(
                    elevation: 10,
                    color: Colors.black,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                      child:
                          Image.network(book.bookInfo.imageLinks!.thumbnail!),
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                top: 75,
                start: 170,
                textDirection: Directionality.of(context),
                child: _bookDetailsBuilder(context),
              ),
            ],
          ),
        ),
        Material(
          elevation: 3,
          child: Container(
            width: double.infinity,
            color: AppColors.background,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppStrings.description,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 400;
  @override
  double get minExtent => 400;

  @override
  bool shouldRebuild(BookDetailsHeader oldDelegate) {
    return true;
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
                    book.bookInfo.title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    AppStrings.author +
                        UiHelper.limitStringLength(
                            str: book.bookInfo.authors!.first
                                .toString()
                                .toLowerCase(),
                            maxLength: 15),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    AppStrings.published + book.bookInfo.publishedDate!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    AppStrings.price +
                        (book.saleInfo.listPrice!.amount.toString() == '0'
                            ? ''
                            : book.saleInfo.listPrice!.amount.toString()) +
                        book.saleInfo.listPrice!.currencyCode!,
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
