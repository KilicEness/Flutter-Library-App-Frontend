import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../services/i_add_book_service.dart';
import './/shared/models/book_detail.dart';

part 'add_book_event.dart';
part 'add_book_state.dart';

class AddBookBloc extends Bloc<AddBookEvent, AddBookState> {
  IAddBookService iAddBookService;

  AddBookBloc({required this.iAddBookService}) : super(AddBookInitial()) {
    on<AddNewBook>(_onAddNewBook); 
  }

  void _onAddNewBook(AddNewBook event, Emitter<AddBookState> emit) async {
    try {
      BookDetailModel createdBook = await iAddBookService.addBook(name: event.name, author: event.author, completed: event.completed);
      event.onSuccess(createdBook);
    } catch (e) {
      event.onFail(e.toString());
    }
  }
}
