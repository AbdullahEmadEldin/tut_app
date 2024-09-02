import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/modules/navigation_bar/library/data/models/saved_book_model.dart';
import 'package:tut_app/modules/navigation_bar/library/data/repo/book_local_db.dart';

part 'set_books_to_lib_state.dart';

class SetBooksToLibCubit extends Cubit<SetBooksToLibState> {
  final BooksSqlDatabase booksSqlDatabase = BooksSqlDatabase();
  SetBooksToLibCubit() : super(SetBooksToLibInitial());

  Future<void> saveBookToLibrary({required SavedBookModel savedBook}) async {
    emit(SetBooksToLibLoading());

    try {
      await booksSqlDatabase.createData(
          tableName: AppConstants.sqlKeys.savedBooksTable,
          values: savedBook.toMap());
      print('Save book Cubit =======Success');
      emit(SetBooksToLibSuccess());
    } catch (e) {
      print('=============> Save book to lib error :: ${e.toString()}');
      emit(SetBooksToLibFailure(error: e.toString()));
    }
  }

  Future<void> unsetBookFromLibrary({required String bookId}) async {
    emit(UnsetBooksLoading());
    try {
      await booksSqlDatabase.deleteData(
          tableName: AppConstants.sqlKeys.savedBooksTable, id: bookId);
      print('Unset book from lib Cubit =======Success');
      emit(UnsetBooksSuccess());
    } catch (e) {
      print('=============> Unset book from lib error :: ${e.toString()}');
      emit(UnsetBooksFailure(error: e.toString()));
    }
  }
}
