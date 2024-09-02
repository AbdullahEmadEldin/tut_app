part of 'get_saved_books_cubit.dart';

@immutable
sealed class GetSavedBooksState {}

final class GetSavedBooksInitial extends GetSavedBooksState {}

final class GetSavedBooksLoading extends GetSavedBooksState {}

final class GetSavedBooksSuccess extends GetSavedBooksState {
  final List<SavedBookModel> savedBooks;
  GetSavedBooksSuccess({required this.savedBooks});
}

final class GetSavedBooksFailure extends GetSavedBooksState {
  final String error;
  GetSavedBooksFailure({required this.error});
}
