import 'package:library_app/shared/helpers/networking.dart';
import '../models/book.dart';
import '../services/i_books_service.dart';

class BooksService implements IBooksService {
  INetwork network;

  BooksService({required this.network});

  @override
  Future<List<BookModel>> fetchBooks() async {
    try {
      var response = await network.get('/books');
      var model = (response.data as List)
          .map((e) => BookModel.fromResponse(e))
          .toList();

      return model;
    } catch (e) {
      throw e.toString();
    }
  }
}
