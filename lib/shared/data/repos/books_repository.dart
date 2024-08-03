import 'package:tut_app/constants/api_endpoints.dart';
import 'package:tut_app/core/services/networking/api_consumer.dart';
import 'package:tut_app/shared/data/models/books_response.dart';

class BooksRepository {
  final ApiConsumer api;

  BooksRepository({
    required this.api,
  });

  Future<BooksResponse> getCategorizedBooks({
    required String category,
    required String lang,
  }) async {
    final response = await api.get(
      path: ApiEndpoints.googleBooksBaseUrl,
      queryParameters: {
        ApiEndpoints.query: "subject:islam",
        ApiEndpoints.langParam: "en",
        ApiEndpoints.maxResults: "15",
        ApiEndpoints.startIndex: "0",
      },
    );
    return BooksResponse.fromJson(response);
  }
}
