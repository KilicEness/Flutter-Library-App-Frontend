part of 'my_books_bloc.dart';

abstract class MyBooksState extends Equatable {
  const MyBooksState();

  @override
  List<Object> get props => [];
}

class MyBooksInitial extends MyBooksState {}

class MyBooksSuccess extends MyBooksState {
  final List<BookDetailModel> myBooks;
  const MyBooksSuccess({
    required this.myBooks
  });
}

class MyBooksFail extends MyBooksState {
  final String errorMessage;
  const MyBooksFail({required this.errorMessage});
}

class MyBooksLoading extends MyBooksState {}
