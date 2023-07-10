part of 'add_book_bloc.dart';

abstract class AddBookState extends Equatable {
  const AddBookState();

  @override
  List<Object> get props => [];
}

class AddBookInitial extends AddBookState {}

class AddBookLoading extends AddBookState {}

class AddBookSuccess extends AddBookState {
  final BookDetailModel addBook;
  const AddBookSuccess({required this.addBook});
}

class AddBookFailure extends AddBookState {
  final String message;
  const AddBookFailure({required this.message});
}
