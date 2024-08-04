part of 'get_books_by_category_cubit.dart';

@immutable
sealed class GetBooksByCategoryState {}

final class GetBooksByCategoryInitial extends GetBooksByCategoryState {}

final class GetBooksByCategoryLoading extends GetBooksByCategoryState {}

final class GetBooksByCategorySuccess extends GetBooksByCategoryState {
  final List<Book> books;

  GetBooksByCategorySuccess({required this.books});
}

final class GetBooksByCategoryFailure extends GetBooksByCategoryState {
  final String errorMsg;

  GetBooksByCategoryFailure({required this.errorMsg});
}
