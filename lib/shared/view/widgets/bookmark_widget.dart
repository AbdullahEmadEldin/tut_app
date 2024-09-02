import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/core/network_helper.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/library/data/models/saved_book_model.dart';
import 'package:tut_app/modules/navigation_bar/library/view_model/cubit/get_saved_books_cubit.dart';
import 'package:tut_app/modules/navigation_bar/library/view_model/cubit/set_books_to_lib_cubit.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/icon_action_button.dart';

class BookmarkWidget extends StatefulWidget {
  final Book book;
  const BookmarkWidget({super.key, required this.book});

  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetBooksToLibCubit, SetBooksToLibState>(
      builder: (context, state) {
        // this to update the state immediately
        bool isBookSaved = false;
        if (state is SetBooksToLibSuccess || _isBookSavedInDB()) {
          isBookSaved = true;
        }
        if (state is UnsetBooksSuccess) {
          isBookSaved = false;
        }

        return IconActionButton(
          onTap: () async {
            if (!_isBookSavedInDB()) {
              await NetworkHelper.covertImageToBytes(
                widget.book.bookInfo.imageLinks!.thumbnail!,
              ).then((bytes) {
                print('==================>> UI set');
                context.read<SetBooksToLibCubit>().saveBookToLibrary(
                      savedBook: SavedBookModel(
                        id: widget.book.id,
                        bookName: widget.book.bookInfo.title,
                        image: bytes,
                      ),
                    );

                /// update saved books list state by getting it again from db
                ///
                context.read<GetSavedBooksCubit>().getSavedBooks();
                return bytes;
              });
              //
            }

            if (_isBookSavedInDB()) {
              print('===== UI UNSET');
              context
                  .read<SetBooksToLibCubit>()
                  .unsetBookFromLibrary(bookId: widget.book.id);

              /// update saved books list state by getting it again from db
              ///
              context.read<GetSavedBooksCubit>().getSavedBooks();
            }
            setState(() {});
          },
          icon: Icon(
            (isBookSaved) ? Icons.bookmark : Icons.bookmark_border,
            color: AppColors().colorScheme.white,
          ),
        );
      },
    );
  }

  /// Initial label the book mark in UI according to database status of this book.
  /// but interacting will be through SetBooksToLibCubit
  bool _isBookSavedInDB() {
    final savedBooks =
        BlocProvider.of<GetSavedBooksCubit>(context).savedBooks ?? [];
    bool isSaved = false;
    for (var book in savedBooks) {
      print(book.id);
      if (book.id == widget.book.id) {
        print('===================== ${savedBooks.length}');
        isSaved = true;
      }
    }
    return isSaved;
  }
}
