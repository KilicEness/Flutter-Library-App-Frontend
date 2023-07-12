import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../services/i_edit_book_service.dart';
import '/shared/models/book_detail.dart';

part 'edit_book_event.dart';
part 'edit_book_state.dart';

class EditBookBloc extends Bloc<EditBookEvent, EditBookState> {
  IEditBookService iEditBookService;
  EditBookBloc({required this.iEditBookService}) : super(EditBookInitial()) {
    on<EditBookEvent>((event, emit) async {
      if (event is EditBookUpdate) {
        emit(EditBookLoading());
        try {
          final bookModel = await iEditBookService.editBook(
            name: event.name,
            author: event.author,
            completed: event.completed,
          );
          emit(EditBookSuccess(book: bookModel));
        } catch (e) {
          emit(EditBookFailure(message: e.toString()));
        }
      }
    });
  }
}
