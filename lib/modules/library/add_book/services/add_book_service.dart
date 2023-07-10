import './/shared/models/book_detail.dart';

import './/shared/helpers/networking.dart';

import './i_add_book_service.dart';

class AddBookService implements IAddBookService {
  INetwork network;

  AddBookService({required this.network});

  @override
  Future<BookDetailModel> addBook(
      {required String name,
      required String author,
      required bool completed}) async {
    try {
      var response = await network.post('/books',
          data: {'name': name, 'author': author, 'completed': completed});

      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
