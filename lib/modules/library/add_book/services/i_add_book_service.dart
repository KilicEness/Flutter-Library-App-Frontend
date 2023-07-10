import './/shared/models/book_detail.dart';

abstract class IAddBookService {
  Future<BookDetailModel> addBook(
      {required String name, required String author, required bool completed});
}
