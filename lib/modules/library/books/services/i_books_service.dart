import 'package:library_app/modules/library/books/models/book.dart';

abstract class IBooksService {
  Future<List<BookModel>> fetchBooks();
}
