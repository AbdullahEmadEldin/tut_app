part of 'get_new_books_cubit.dart';

@immutable
sealed class GetNewBooksState {}

final class GetNewBookInitial extends GetNewBooksState {}

final class GetNewBookLoading extends GetNewBooksState {}

final class GetNewBooksSuccess extends GetNewBooksState {
  final List<Book> books;

  GetNewBooksSuccess({required this.books});
}

final class GetNewBookFailure extends GetNewBooksState {
  final String errorMsg;

  GetNewBookFailure({required this.errorMsg});
}
