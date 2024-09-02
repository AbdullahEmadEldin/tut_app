import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/library/data/models/saved_book_model.dart';
import 'package:tut_app/shared/view/pages/book_details_page.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';
import 'package:tut_app/shared/view_model/cubit/get_book_by_id_cubit.dart';

class SavedBookTile extends StatelessWidget {
  final SavedBookModel savedBook;

  const SavedBookTile({
    super.key,
    required this.savedBook,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 6,
            shadowColor: AppColors().colorScheme.primary,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                print('!!!!!!!!!!!!!!!!!!!!!!!!!!!111');
                context
                    .read<GetBookByIdCubit>()
                    .getBookById(id: savedBook.id)
                    .then((book) {
                  Navigator.pushNamed(context, BookDetailsPage.routeName,
                      arguments:
                          BookDetailsArgs(book: book, heroTag: savedBook.id));
                }).onError((e, s) {
                  print('xxxxxxxxxxxxxxxxxxxxxxxxxxxx');

                  showToast(
                    context,
                    'Something went wrong Try again',
                    isError: true,
                  );
                });
              },
              child: Hero(
                tag: savedBook.id,
                child: ClipRect(
                  child: Image.memory(
                    savedBook.image,
                  ),
                ),
              ),
            ),
          ),
          Text(
            savedBook.bookName,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors().colorScheme.darkGrey,
                ),
          )
        ],
      ),
    );
  }
}
