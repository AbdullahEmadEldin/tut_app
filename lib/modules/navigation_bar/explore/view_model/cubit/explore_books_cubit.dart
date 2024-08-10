// ignore_for_file: avoid_print

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

  //! All of these variables act as a global vars that used in various places.
  //!====================================== IMP NOTE ======================================
  //! The best practice is to make a separate cubit for search but there is no time. ======
  /// This category is set at first in CategoriesListView and we access it in Pagination calls
  BooksCategory? _category;

  /// This bool is used to check if a new category has been selected and if true it will reset the list in UI.
  bool? _newCategory;

  /// Access Category from outside the cubit by setter and getter
  setCategory(BooksCategory? category) => _category = category;
  BooksCategory? getCategory() => _category;

  /// Access newCategory from outside the cubit by setter and getter
  newCategory(bool newCategory) => _newCategory = newCategory;
  getNewCategoryBool() => _newCategory ?? false;

  /// This searchItem is set at first in SearchTextField and we access it in Pagination calls
  String? _searchItem;
  String? searchItem() => _searchItem;

  /// This bool is used to check if a new search has been selected and if true it will reset the list in UI.
  /// it will be set to true in SearchTextField and false in Pagination calls.
  bool? _firstSearchCall;
  firstSearchCall() => _firstSearchCall;

  setFirstSearchCall(bool firstSearchCall) =>
      _firstSearchCall = firstSearchCall;

  ///!!!!!!!!!!!!!!!!!!!!!!!!
  int _groupValue = -1;
  groupValue() {
    print('========================NNEW:: $_groupValue');
    return _groupValue;
  }

  setGroupValue(int groupValue) => _groupValue = groupValue;

  /// Switch to search make 3 Changes:
  /// ==> Clear the category selection by set Category to null.
  /// ==> Switch the pagination call to set from search method by set Category to null.
  /// ==> Clear Pagination by Set the firstSearchCall to true
  switchToSearch() {
    print('INSIDE CUBIT:::  switch to search');
    setGroupValue(-2);
    setCategory(null);
    setFirstSearchCall(true);
    emit(SwitchToSearchState());
  }

  ///
  Future<void> searchForBook(
      {required String searchItem, required int startIndex}) async {
    print('INSIDE CUBIT:::+++++++ Search ');

    _searchItem = searchItem;
    _groupValue = -2;
    emit(FetchingBooksLoading());
    try {
      final booksResponse = await repository.searchForBook(
        searchTerm: searchItem,
        lang: 'en',
        startIndex: startIndex,
      );
      emit(SearchBooksSuccess(books: booksResponse.books ?? []));
    } catch (e) {
      emit(FetchingBooksFailure(errorMsg: e.toString()));
    }
  }

  Future<void> getCategorizedBooks({
    required BooksCategory category,
    required String lang,
    required int startIndex,
  }) async {
    print('INSIDE CUBIT::: -------------------- Category ${category.name}');

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
