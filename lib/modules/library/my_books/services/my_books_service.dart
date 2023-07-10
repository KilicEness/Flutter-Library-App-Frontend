//network
import 'package:library_app/shared/models/book_detail.dart';
import './/shared/helpers/networking.dart';

import './i_my_books_service.dart';

class MyBooksService implements IMyBooksService {
  INetwork network;

  MyBooksService({required this.network});

  @override
  Future<List<BookDetailModel>> fetchMyBooks(
      {required String userId}) async {
    //API
    try {
      var response = await network.get('/books/$userId/myBooks');
      var model = (response.data as List)
          .map((e) => BookDetailModel.fromResponse(e))
          .toList();

      return model;
    } catch (e) {
      throw e.toString();
    }
  }
}
