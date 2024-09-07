import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/network_helper.dart';
import 'package:tut_app/core/theme/theme_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/book_info_texts.dart';
import 'package:tut_app/shared/view/widgets/bookmark_widget.dart';
import 'package:tut_app/shared/view/widgets/icon_action_button.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';

class BookDetailsHeader extends SliverPersistentHeaderDelegate {
  final Book book;
  final String heroTag;
  BookDetailsHeader({required this.book, required this.heroTag});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        ClipRect(
          child: Stack(
            children: [
              /// The background image which will be blurred.
              book.bookInfo.imageLinks == null
                  ? Image.asset(
                      AppAssets.images.fakeBookCover,
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 320),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      book.bookInfo.imageLinks!.thumbnail!,
                      fit: BoxFit.fill,
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 320),
                      width: double.infinity,
                    ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                top: 100,
                start: 22,
                child: Hero(
                  tag: heroTag,
                  child: Material(
                    elevation: 10,
                    color: Colors.black,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                      child: book.bookInfo.imageLinks == null
                          ? Image.asset(
                              AppAssets.images.fakeBookCover,
                              height: 180,
                            )
                          : Image.network(book.bookInfo.imageLinks!.thumbnail!),
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                top: 100,
                start: 170,
                textDirection: Directionality.of(context),
                child: BookInfoTexts(book: book),
              ),
            ],
          ),
        ),
        Material(
          elevation: 3,
          child: Container(
            width: double.infinity,
            color: AppThemes.instance.themeNotifier.value == ThemeMode.dark
                ? const Color(0xff0F2027)
                : AppColors().colorScheme.background,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.synopsis.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconActionButton(
                      onTap: () async {
                        await _handleDownloadBookCases(context);
                      },
                      isAvailable: book.accessInfo.epub!.downloadLink != null ||
                          book.accessInfo.pdf!.downloadLink != null ||
                          book.accessInfo.pdf!.acsTokenLink != null,
                      icon: Icon(
                        Icons.download,
                        color: AppColors().colorScheme.white,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconActionButton(
                      onTap: () async {
                        if (book.bookInfo.previewLink != null) {
                          //
                          await NetworkHelper.customLaunchUrl(context,
                              url: book.bookInfo.previewLink!);
                          //
                        } else {
                          showToast(context, AppStrings.notAvailable.tr(),
                              isError: true);
                        }
                      },
                      isAvailable: book.bookInfo.previewLink != null,
                      icon: Icon(
                        Icons.preview_outlined,
                        color: AppColors().colorScheme.white,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    BookmarkWidget(book: book)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleDownloadBookCases(BuildContext context) async {
    if (book.accessInfo.epub!.downloadLink != null) {
      //
      print('==========>>>> EPUP');
      await NetworkHelper.customLaunchUrl(context,
          url: book.accessInfo.epub!.downloadLink!);
      //
    } else if (book.accessInfo.pdf!.downloadLink != null ||
        book.accessInfo.pdf!.acsTokenLink != null) {
      print('==========>>>> pdf .... access token');

      //
      await NetworkHelper.customLaunchUrl(context,
          url: book.accessInfo.pdf!.acsTokenLink ??
              book.accessInfo.pdf!.downloadLink!);
      //
    } else {
      showToast(context, AppStrings.notAvailable.tr(), isError: true);
    }
  }

  @override
  double get maxExtent => 400;
  @override
  double get minExtent => 400;

  @override
  bool shouldRebuild(BookDetailsHeader oldDelegate) {
    return true;
  }
}
