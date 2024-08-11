import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/shared/data/models/book.dart';

class BookInfoTexts extends StatelessWidget {
  final Book book;
  const BookInfoTexts({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
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
                      AppStrings.author.tr() +
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
                      AppStrings.published.tr() + book.bookInfo.publishedDate!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Text(
                      AppStrings.price.tr() +
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
      ),
    );
  }
}
