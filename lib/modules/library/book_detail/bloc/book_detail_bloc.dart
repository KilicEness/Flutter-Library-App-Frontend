import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../services/i_book_detail_service.dart';
import '../models/book_detail.dart';

part 'book_detail_event.dart';
part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final IBookDetailService iBookDetailService;
  BookDetailBloc({required this.iBookDetailService})
      : super(BookDetailInitial()) {
    on<BookDetailFetchEvent>((event, emit) async {
      try {
        emit(BookDetailLoading());

        var result = await iBookDetailService.fetchBookDetail();
        emit(BookDetailSuccess(bookDetail: result));
      } catch (e) {
        emit(BookDetailFail(errorMessage: e.toString()));
      }
    });
  }
}
