part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksInitial extends BooksState {}

class BooksSuccess extends BooksState {
  final List<BookModel> books;
  const BooksSuccess({required this.books});
}

class BooksLoading extends BooksState {}

class BooksFailure extends BooksState {
  final String message;
  const BooksFailure({required this.message});
}
