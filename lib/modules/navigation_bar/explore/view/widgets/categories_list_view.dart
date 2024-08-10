import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/book_category_tile.dart';
import 'package:tut_app/modules/navigation_bar/explore/view_model/cubit/explore_books_cubit.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  late ExploreBooksCubit exploreBooksCubit;
  int _groupValue = -1;
  @override
  void initState() {
    exploreBooksCubit = BlocProvider.of<ExploreBooksCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExploreBooksCubit, ExploreBooksState>(
      listener: (context, state) {
        if (state is SwitchToSearchState) {
          setState(() {
            _groupValue = -2;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
        child: SizedBox(
          height: UiHelper.getResponsiveDimension(context, baseDimension: 115),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: BooksCategory.values.length,
            itemBuilder: (context, index) => BooksCategory.values
                .map((e) => CategoryTile(
                      category: e,
                      onTap: () {
                        setState(() {
                          exploreBooksCubit.setGroupValue(index);
                          _groupValue = index;
                          exploreBooksCubit.getCategorizedBooks(
                              category: e, lang: 'en', startIndex: 0);
                          exploreBooksCubit.setCategory(e);
                          exploreBooksCubit.newCategory(true);
                        });
                      },
                      isSelected: _groupValue == index,
                    ))
                .toList()[index],
          ),
        ),
      ),
    );
  }
}
