//abstract
import '../../../../shared/models/book_detail.dart';

abstract class IBookDetailService{
  Future<List<BookDetailModel>> fetchBookDetail({required String userId});
}