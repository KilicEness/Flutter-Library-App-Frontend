import '../models/book_have_id.dart';

abstract class IEditBookService {
  Future<BookModel> editBook(
      {String? name, String? author, bool? completed, required String bookId});

  Future<BookModel> fetchBook({
    required String bookId,
  });
}
