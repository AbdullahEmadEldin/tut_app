import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/books_response.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';
import 'package:tut_app/shared/data/repos/books_repository.dart';

part 'explore_books_state.dart';

class ExploreBooksCubit extends Cubit<ExploreBooksState> {
  final BooksRepository repository;
  ExploreBooksCubit(this.repository) : super(ExploreBooksInitial());

  /// This category is set at first in CategoriesListView and is used in Pagination calls
  BooksCategory? _category;

  /// This bool is used to check if a new category has been selected and if true it will reset the list in UI.
  bool? _newCategory;

  /// Access Category from outside the cubit by setter and getter
  setCategory(BooksCategory category) => _category = category;
  BooksCategory getCategory() => _category!;

  /// Access newCategory from outside the cubit by setter and getter
  newCategory(bool newCategory) => _newCategory = newCategory;
  getNewCategoryBool() => _newCategory ?? false;
  Future<void> searchForBook({required String searchItem}) async {
    emit(FetchingBooksLoading());
    try {
      final booksResponse = await repository.searchForBook(
        searchTerm: searchItem,
        lang: 'en',
      );
      emit(FetchingBooksSuccess(books: booksResponse.books ?? []));
    } catch (e) {
      emit(FetchingBooksFailure(errorMsg: e.toString()));
    }
  }

  Future<void> getCategorizedBooks({
    required BooksCategory category,
    required String lang,
    required int startIndex,
  }) async {
    emit(FetchingBooksLoading());
    try {
      final BooksResponse booksResponse = await repository.getCategorizedBooks(
        category: category,
        lang: lang,
        startIndex: startIndex,
      );
      print('====>CUBIT::::: ${booksResponse.books?.first.bookInfo.title}');
      emit(FetchingBooksSuccess(books: booksResponse.books ?? []));
    } catch (e) {
      emit(FetchingBooksFailure(errorMsg: e.toString()));
    }
  }
}
