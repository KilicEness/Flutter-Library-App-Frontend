part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

class BooksFetch extends BooksEvent {
  BooksFetch();
}

// class BooksFetchByUser extends BooksEvent {
//   final String ownerId;
//   BooksFetchByUser(
//       {required this.ownerId});
// }