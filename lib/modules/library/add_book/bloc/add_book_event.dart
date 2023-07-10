part of 'add_book_bloc.dart';

abstract class AddBookEvent extends Equatable {
  const AddBookEvent();

  @override
  List<Object> get props => [];
}

class AddNewBook extends AddBookEvent {
  final String name;
  final String author;
  final bool completed;
  final Function(BookDetailModel) onSuccess;
  final Function(String message) onFail;
  const AddNewBook(
      {required this.name,
      required this.author,
      required this.completed,
      required this.onSuccess,
      required this.onFail});
}
