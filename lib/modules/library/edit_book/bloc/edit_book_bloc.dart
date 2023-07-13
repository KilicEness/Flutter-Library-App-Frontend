import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/book_have_id.dart';
import 'package:library_app/shared/helpers/local_storage.dart';

import '../services/i_edit_book_service.dart';

part 'edit_book_event.dart';
part 'edit_book_state.dart';

class EditBookBloc extends Bloc<EditBookEvent, EditBookState> {
  IEditBookService iEditBookService;
  EditBookBloc({required this.iEditBookService}) : super(EditBookInitial()) {
    on<EditBookEvent>(_onEditBook);
    on<BookFetch>(_onBookFetch);
  }

  void _onBookFetch(event, emit) async {
    emit(EditBookLoading());
    try {
      var result = await iEditBookService.fetchBook(bookId: event.bookId);
      emit(EditBookSuccess(book: result));
    } catch (e) {
      emit(EditBookFailure(message: e.toString()));
    }
  }

  void _onEditBook(event, emit) async {
    if (event is EditBookUpdate) {
      emit(EditBookLoading());
      try {
        ILocalStorage localStorage = SPStorage();
        var bookId = await localStorage.getData('bookId');
        final updatedBook = await iEditBookService.editBook(
          name: event.name,
          author: event.author,
          completed: event.completed,
          bookId: bookId,
        );
        emit(EditBookSuccess(book: updatedBook));
      } catch (e) {
        emit(EditBookFailure(message: e.toString()));
      }
    }
  }
}
