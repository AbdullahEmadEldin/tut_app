import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/modules/navigation_bar/explore/view/widgets/empty_books_grid.dart';
import 'package:tut_app/modules/navigation_bar/library/view/widgets/saved_book_tile.dart';
import 'package:tut_app/modules/navigation_bar/library/view_model/cubit/get_saved_books_cubit.dart';
import 'package:tut_app/shared/view/widgets/book_tile_shimmer.dart';

class SavedBooksGridView extends StatelessWidget {
  const SavedBooksGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedBooksCubit, GetSavedBooksState>(
      builder: (context, state) {
        if (state is GetSavedBooksLoading) {
          print('============>>> Loading');
          SizedBox(
            height: 500,
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return const BookTileShimmer();
              },
            ),
          );
        }
        if (state is GetSavedBooksSuccess) {
          if (state.savedBooks.isEmpty) {
            return EmptyBooksGrid(
              message: AppStrings.emptyBooksLib.tr(),
            );
          }
          return Flexible(
            child: GridView.builder(
              itemCount: state.savedBooks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.55,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return SavedBookTile(
                  savedBook: state.savedBooks[index],
                );
              },
            ),
          );
        }
        if (state is GetSavedBooksFailure) {
          print('============>>> Faiil');

          return Text(state.error);
        }
        print('============>>> ELsEEEEEE');

        return EmptyBooksGrid(
          message:
              'Add Some Books to your library state : ${state.runtimeType}',
        );
      },
    );
  }
}
