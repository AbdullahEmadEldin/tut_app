import 'package:flutter/material.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/shared/data/models/book.dart';

class BookTile extends StatelessWidget {
  final BookInfo book;
  final double? imageHeight;
  final double? imageWidth;
  final bool inStaggeredView;
  const BookTile({
    super.key,
    required this.book,
    this.imageHeight,
    this.imageWidth,
    this.inStaggeredView = false,
  });

  @override
  Widget build(BuildContext context) {
    // Handling the long book title.
    String bookTitle = Helper.limitStringLength(str: book.title, maxLength: 18);
    return Padding(
      padding: inStaggeredView
          ? const EdgeInsets.symmetric(horizontal: 4, vertical: 4)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            elevation: 6,
            shadowColor: AppColors.primary,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {},
              child: (book.imageLinks?.thumbnail != null)
                  //todo: replace with network image
                  ? Image.network(
                      book.imageLinks!.thumbnail!,
                      width: imageWidth ??
                          Helper.getResponsiveDimension(context,
                              baseDimension: 230),
                      height: imageHeight ??
                          Helper.getResponsiveDimension(
                            context,
                            baseDimension: 340,
                          ),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppAssets.images.fakeBookCover,
                      width: imageWidth ??
                          Helper.getResponsiveDimension(context,
                              baseDimension: 230),
                      height: imageHeight ??
                          Helper.getResponsiveDimension(
                            context,
                            baseDimension: 340,
                          ),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(
            height: Helper.getResponsiveDimension(context, baseDimension: 8),
          ),
          if (!inStaggeredView)
            Text(
              bookTitle,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.darkGrey,
                  ),
            )
        ],
      ),
    );
  }
}
