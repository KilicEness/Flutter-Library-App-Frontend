import '../models/book_have_id.dart';
import '/shared/helpers/networking.dart';

import './i_edit_book_service.dart';

class EditBookService implements IEditBookService {
  INetwork network;

  EditBookService({required this.network});

 @override
  Future<BookModel> fetchBook(
      {required String bookId}) async {
    try {
      var response = await network.get('/books/$bookId');
      var model = BookModel.fromResponse(response.data);
      return model;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<BookModel> editBook(
      {String? name, String? author, bool? completed, required String bookId}) async {
    try {
      var response = await network.patch('/books/$bookId', data: {
        'name': name,
        'author': author,
        'completed': completed,
      });
      var result = BookModel.fromResponse(response.data['result']);
      return result;
    } catch (e) {
      throw e.toString();
    }
  }
}
