import 'package:tut_app/shared/data/models/book.dart';

/// This response is a reflect of Google book API
class BooksResponse {
  /// This represents the kins of the response (book or magazine)
  String? kind;
  int? totalItems;
  List<Book>? books;

  BooksResponse({this.kind, this.totalItems, this.books});

  BooksResponse.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      books = [];
      json['items'].forEach((i) {
        books!.add(
          Book.fromMap(i),
        );
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['kind'] = kind;
    data['totalItems'] = totalItems;
    if (books != null) {
      data['items'] = books!.map((i) => i.toMap()).toList();
    }
    return data;
  }
}
