import 'package:flutter/material.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';

class CategoryTile extends StatelessWidget {
  final BooksCategory category;
  final bool isSelected;
  final Function()? onTap;
  const CategoryTile({
    super.key,
    required this.category,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.secondaryLight : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grey.withOpacity(0.5),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              category.icon,
              width: Helper.getResponsiveDimension(context, baseDimension: 55),
              height: Helper.getResponsiveDimension(context, baseDimension: 50),
            ),
            Text(
              category.name,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
