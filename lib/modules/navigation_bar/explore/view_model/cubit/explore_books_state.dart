part of 'explore_books_cubit.dart';

@immutable
sealed class ExploreBooksState {}

final class ExploreBooksInitial extends ExploreBooksState {}

final class FetchingBooksLoading extends ExploreBooksState {}

final class FetchingBooksSuccess extends ExploreBooksState {
  final List<Book> books;

  FetchingBooksSuccess({required this.books});
}

final class FetchingBooksFailure extends ExploreBooksState {
  final String errorMsg;

  FetchingBooksFailure({required this.errorMsg});
}
