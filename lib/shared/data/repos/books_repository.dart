import 'package:tut_app/constants/api_endpoints.dart';
import 'package:tut_app/core/services/networking/api_consumer.dart';
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
        ApiEndpoints.query: ApiEndpoints.qNewRelease,
        ApiEndpoints.langParam: "en",
        ApiEndpoints.maxResults: "10",
        ApiEndpoints.startIndex: "0",
      },
    );
    return BooksResponse.fromJson(response);
  }

  Future<BooksResponse> getCategorizedBooks({
    required BooksCategory category,
    required String lang,
  }) async {
    final response = await api.get(
      path: ApiEndpoints.googleBooksBaseUrl,
      queryParameters: {
        ApiEndpoints.query: "subject:$category",
        ApiEndpoints.langParam: "en",
        ApiEndpoints.maxResults: "10",
        ApiEndpoints.startIndex: "0",
      },
    );
    return BooksResponse.fromJson(response);
  }

  Future<BooksResponse> searchForBook({
    required String searchTerm,
    required String lang,
  }) async {
    final response = await api.get(
      path: ApiEndpoints.googleBooksBaseUrl,
      queryParameters: {
        ApiEndpoints.query: searchTerm,
        ApiEndpoints.langParam: "en",
        ApiEndpoints.maxResults: "10",
        ApiEndpoints.startIndex: "0",
      },
    );
    return BooksResponse.fromJson(response);
  }
}
