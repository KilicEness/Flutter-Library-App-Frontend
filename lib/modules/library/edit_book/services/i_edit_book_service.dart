import '../models/book_have_id.dart';

abstract class IEditBookService {
  Future<BookModel> editBook(
      {String? name, String? author, bool? completed});

  Future<BookModel> fetchBook({
    required String bookId,
  });
}
