part of 'edit_book_bloc.dart';

abstract class EditBookEvent extends Equatable {
  const EditBookEvent();

  @override
  List<Object> get props => [];
}

class BookFetch extends EditBookEvent {
  final String bookId;
  const BookFetch(this.bookId);
}

class EditBookUpdate extends EditBookEvent {
  final String? name;
  final String? author;
  final bool? completed;

  const EditBookUpdate({this.name, this.author, this.completed});
}
