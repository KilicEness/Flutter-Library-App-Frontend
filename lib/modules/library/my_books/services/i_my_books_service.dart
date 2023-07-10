//abstract
import './/shared/models/book_detail.dart';

abstract class IMyBooksService{
  Future<List<BookDetailModel>> fetchMyBooks({required String userId});
}