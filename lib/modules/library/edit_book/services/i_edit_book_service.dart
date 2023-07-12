import '/shared/models/book_detail.dart';

abstract class IEditBookService {
  Future<BookDetailModel> editBook(
      {String? name, String? author, bool? completed});
}
