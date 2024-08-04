import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/book_sub_models.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';
import 'package:tut_app/shared/data/repos/books_repository.dart';

part 'get_books_by_category_state.dart';

class GetBooksByCategoryCubit extends Cubit<GetBooksByCategoryState> {
  final BooksRepository repo;
  GetBooksByCategoryCubit({
    required this.repo,
  }) : super(GetBooksByCategoryInitial());

  Future<void> getCategorizedBooks({
    required BooksCategory category,
    required String lang,
  }) async {
    emit(GetBooksByCategoryLoading());
    try {
      // final booksResponse = await repo.getCategorizedBooks(
      //   category: category,
      //   lang: lang,
      // );
      // print('Test:::::::::::::::: ${booksResponse.totalItems}');

      List<Book> books = await _getMockBooks();

      emit(GetBooksByCategorySuccess(books: books));
    } catch (e) {
      print('====. Erorr: ${e.toString()}');
      emit(GetBooksByCategoryFailure(errorMsg: e.toString()));
    }
  }

  Future<List<Book>> _getMockBooks() async =>
      Future.delayed(Duration(seconds: 3), () {
        return [
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "This is a long book title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "Test 2 for a long book title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover2,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover2,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover2,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
          Book(
              kind: 'kind',
              id: 'id',
              bookInfo: BookInfo(
                  title: "title",
                  imageLinks: ImageLinks(
                    thumbnail: AppAssets.images.fakeBookCover,
                  )),
              saleInfo: SaleInfo(),
              accessInfo: AccessInfo()),
        ];
      });
}
