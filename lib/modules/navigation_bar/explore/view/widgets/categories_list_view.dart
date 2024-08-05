import 'package:flutter/material.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/book_category_tile.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int? groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
      child: SizedBox(
        height: Helper.getResponsiveDimension(context, baseDimension: 115),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: BooksCategory.values.length,
          itemBuilder: (context, index) => BooksCategory.values
              .map((e) => CategoryTile(
                    category: e,
                    onTap: () {
                      setState(() {
                        groupValue = index;
                      });
                    },
                    isSelected: groupValue == index,
                  ))
              .toList()[index],
        ),
      ),
    );
  }
}
