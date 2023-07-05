//network

import 'package:library_app/modules/library/book_detail/models/book_detail.dart';

import './i_book_detail_service.dart';

class BookDetailService implements IBookDetailService {
  @override
  Future<BookDetailModel> fetchBookDetail() async{
    //API
    await Future.delayed(const Duration(seconds: 1));
    return BookDetailModel(title: "Hamdi", description: "Colins");
  }
}