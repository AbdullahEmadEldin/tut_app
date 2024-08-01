import 'package:flutter/material.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/shared/data/models/book.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              child: Image.asset(
                book.image,
                width:
                    Helper.getResponsiveDimension(context, baseDimension: 230),
                height:
                    Helper.getResponsiveDimension(context, baseDimension: 340),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: Helper.getResponsiveDimension(context, baseDimension: 8),
          ),
          Text(
            book.name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.darkGrey,
                ),
          )
        ],
      ),
    );
  }
}
