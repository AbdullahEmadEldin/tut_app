part of 'set_books_to_lib_cubit.dart';

@immutable
sealed class SetBooksToLibState {}

final class SetBooksToLibInitial extends SetBooksToLibState {}

//! Set books to library states
final class SetBooksToLibLoading extends SetBooksToLibState {}

final class SetBooksToLibSuccess extends SetBooksToLibState {}

final class SetBooksToLibFailure extends SetBooksToLibState {
  final String error;
  SetBooksToLibFailure({required this.error});
}

//! unset book from library states
final class UnsetBooksLoading extends SetBooksToLibState {}

final class UnsetBooksSuccess extends SetBooksToLibState {}

final class UnsetBooksFailure extends SetBooksToLibState {
  final String error;
  UnsetBooksFailure({required this.error});
}
