//abstract
import '../models/book_detail.dart';

abstract class IBookDetailService{
  Future<BookDetailModel> fetchBookDetail();
}