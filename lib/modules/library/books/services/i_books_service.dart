import '../models/book.dart';

abstract class IBooksService {
  Future<List<BookModel>> fetchBooks();
}
