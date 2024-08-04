import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/book_sub_models.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';
import 'package:tut_app/shared/data/repos/books_repository.dart';

part 'get_new_books_state.dart';

class GetNewBooksCubit extends Cubit<GetNewBooksState> {
  final BooksRepository repo;
  GetNewBooksCubit({
    required this.repo,
  }) : super(GetNewBookInitial());

  /// get books by it's category
  ///  `category` : will be passed by choosing one in Explore screen.
  /// `lang` : will be passed by choosing one in Explore screen.
  Future<void> getCategorizedBooks({
    required BooksCategory category,
    required String lang,
  }) async {
    emit(GetNewBookLoading());
    try {
      final booksResponse = await repo.getNewReleaseBooks(
        lang: lang,
      );
      print('Test:::::::::::::::: ${booksResponse.totalItems}');

      // List<Book> books = await _getMockBooks();

      emit(GetBooksByCategorySuccess(books: booksResponse.books ?? []));
    } catch (e) {
      print('====. Erorr: ${e.toString()}');
      emit(GetNewBookFailure(errorMsg: e.toString()));
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
