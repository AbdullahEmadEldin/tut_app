import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';
import 'package:tut_app/shared/data/repos/books_repository.dart';

part 'explore_books_state.dart';

class ExploreBooksCubit extends Cubit<ExploreBooksState> {
  final BooksRepository repository;
  ExploreBooksCubit(this.repository) : super(ExploreBooksInitial());

  BooksCategory? _category;

  setCategory(BooksCategory category) => _category = category;
  getCategory() => _category;
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
      final booksResponse = await repository.getCategorizedBooks(
        category: category,
        lang: lang,
        startIndex: startIndex,
      );
      print('====>CUBIT::::: ${booksResponse.books?.length}');
      emit(FetchingBooksSuccess(books: booksResponse.books ?? []));
    } catch (e) {
      emit(FetchingBooksFailure(errorMsg: e.toString()));
    }
  }
}
