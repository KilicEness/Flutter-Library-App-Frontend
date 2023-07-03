import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/i_books_service.dart';
import '../models/book.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  IBooksService iBooksService;
  BooksBloc({required this.iBooksService})
      : super(BooksInitial()) {
    on<BooksFetch>(_fetchBooks);
  }

  void _fetchBooks(
      BooksFetch event, Emitter<BooksState> emit) async {
    try {
      emit(BooksLoading());
      var response = await iBooksService.fetchBooks();
      emit(BooksSuccess(books: response));
    } catch (e) {
      emit(BooksFailure(message: e.toString()));
    }
  }
}
