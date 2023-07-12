import 'package:library_app/shared/helpers/networking.dart';
import 'package:library_app/shared/models/book_detail.dart';

import './i_edit_book_service.dart';

class EditBookService implements IEditBookService {
  INetwork network;

  EditBookService({required this.network});

  @override
  Future<BookDetailModel> editBook(
      {String? name, String? author, bool? completed}) async {
    try {
      var response = await network.patch('/books', data: {
        'name': name,
        'author': author,
        'completed': completed,
      });
      var result = BookDetailModel.fromResponse(response.data['result']);
      return result;
    } catch (e) {
      throw e.toString();
    }
  }
}
