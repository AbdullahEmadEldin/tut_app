import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/modules/navigation_bar/library/data/models/saved_book_model.dart';
import 'package:tut_app/modules/navigation_bar/library/data/repo/book_local_db.dart';

part 'get_saved_books_state.dart';

class GetSavedBooksCubit extends Cubit<GetSavedBooksState> {
  final BooksSqlDatabase booksSqlDatabase = BooksSqlDatabase();
  GetSavedBooksCubit() : super(GetSavedBooksInitial());

  List<SavedBookModel>? savedBooks;

  /// This method will be called in the first entry of home page
  /// to get all saved books and use it to label the bookmark icon in book details
  /// even if the user go to it from library or from home or from explore.
  Future<void> getSavedBooks() async {
    emit(GetSavedBooksLoading());
    try {
      final books = await booksSqlDatabase.readData(
        tableName: AppConstants.sqlKeys.savedBooksTable,
      );
      savedBooks = books
          .map((map) => SavedBookModel.fromMap(map as Map<String, dynamic>))
          .toList();
      emit(
        /// Parse it to model in UI
        GetSavedBooksSuccess(
            savedBooks: books
                .map((map) =>
                    SavedBookModel.fromMap(map as Map<String, dynamic>))
                .toList()),
      );
    } catch (e) {
      emit(GetSavedBooksFailure(error: e.toString()));
    }
  }
}
