import 'package:tut_app/constants/api_endpoints.dart';
import 'package:tut_app/core/lang_manager.dart';
import 'package:tut_app/core/services/networking/api_consumer.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/books_response.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';

//todo: passing Language need to be handled in all methods
class BooksRepository {
  final ApiConsumer api;

  BooksRepository({
    required this.api,
  });

  /// This method will get new release books
  /// Language will the default lang of the app.
  Future<BooksResponse> getNewReleaseBooks({
    required String lang,
  }) async {
    final response = await api.get(
      path: ApiEndpoints.googleBooksBaseUrl,
      queryParameters: {
        ApiEndpoints.query: 'subject:Novels',
        ApiEndpoints.qLangParam: await LanguageManager.getAppLang(),
        ApiEndpoints.qMaxResults:
            "20", // this will be static value as UI won't need more than 20 book.
        ApiEndpoints.qStartIndex: "0",
        ApiEndpoints.qProjection: ApiEndpoints.fullVolumeInfo,
      },
    );
    return BooksResponse.fromJson(response);
  }

  Future<Book> getBookById({
    required String id,
  }) async {
    final response =
        await api.get(path: 'https://www.googleapis.com/books/v1/volumes/$id');

    return Book.fromMap(response);
  }

  Future<BooksResponse> getCategorizedBooks({
    required BooksCategory category,
    required String lang,
    required int startIndex,
  }) async {
    final response = await api.get(
      path: ApiEndpoints.googleBooksBaseUrl,
      queryParameters: {
        ApiEndpoints.query: "subject:${category.name}",
        ApiEndpoints.qLangParam: await LanguageManager.getAppLang(),
        ApiEndpoints.qMaxResults: "20",
        ApiEndpoints.qStartIndex: "$startIndex",
        ApiEndpoints.qProjection: ApiEndpoints.fullVolumeInfo,
      },
    );
    return BooksResponse.fromJson(response);
  }

  Future<BooksResponse> searchForBook({
    required String searchTerm,
    required String lang,
    required int startIndex,
  }) async {
    final response = await api.get(
      path: ApiEndpoints.googleBooksBaseUrl,
      queryParameters: {
        ApiEndpoints.query: searchTerm,
        ApiEndpoints.qMaxResults: "20",
        ApiEndpoints.qStartIndex: "$startIndex",
        ApiEndpoints.qProjection: ApiEndpoints.fullVolumeInfo,
      },
    );
    return BooksResponse.fromJson(response);
  }
}
