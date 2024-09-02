import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/core/services/networking/dio_comsumer.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/repos/books_repository.dart';

part 'get_book_by_id_state.dart';

class GetBookByIdCubit extends Cubit<GetBookByIdState> {
  final BooksRepository booksRepository = BooksRepository(api: DioConsumer());
  GetBookByIdCubit() : super(GetBookByIdInitial());

  Future<Book> getBookById({required String id}) async {
    try {
      final book = await booksRepository.getBookById(id: id);
      return book;
    } catch (e) {
      print('What is the fuck is that ??? $e');
      rethrow;
    }
  }
}
