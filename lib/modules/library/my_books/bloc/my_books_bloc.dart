import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_app/shared/helpers/local_storage.dart';
import './/shared/models/book_detail.dart';

import '../services/i_my_books_service.dart';

part 'my_books_event.dart';
part 'my_books_state.dart';

class MyBooksBloc extends Bloc<MyBooksEvent, MyBooksState> {
  final IMyBooksService iMyBooksService;
  MyBooksBloc({required this.iMyBooksService})
      : super(MyBooksInitial()) {
    on<MyBooksFetchEvent>((event, emit) async {
      try {
        emit(MyBooksLoading());

        ILocalStorage localStorage = SPStorage();
        var userId = await localStorage.getData('userId');
        var result =
            await iMyBooksService.fetchMyBooks(userId: userId);
        emit(MyBooksSuccess(myBooks: result));
      } catch (e) {
        emit(MyBooksFail(errorMessage: e.toString()));
      }
    });
  }
}
