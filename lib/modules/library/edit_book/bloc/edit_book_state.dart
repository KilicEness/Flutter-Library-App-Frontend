part of 'edit_book_bloc.dart';

abstract class EditBookState extends Equatable {
  const EditBookState();

  @override
  List<Object> get props => [];
}

class EditBookInitial extends EditBookState {}

class EditBookLoading extends EditBookState {}

class EditBookSuccess extends EditBookState {
  final BookModel book;
  const EditBookSuccess({required this.book});
}

class EditBookFailure extends EditBookState {
  final String message;
  const EditBookFailure({required this.message});
}