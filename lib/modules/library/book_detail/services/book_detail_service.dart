//network
import '../models/book_detail.dart';
import './/shared/helpers/networking.dart';

import './i_book_detail_service.dart';

class BookDetailService implements IBookDetailService {
  INetwork network;

  BookDetailService({required this.network});

  @override
  Future<List<BookDetailModel>> fetchBookDetail(
      {required String userId}) async {
    //API
    try {
      var response = await network.get('/books/$userId/books');
      var model = (response.data as List)
          .map((e) => BookDetailModel.fromResponse(e))
          .toList();

      return model;
    } catch (e) {
      throw e.toString();
    }
  }
}
