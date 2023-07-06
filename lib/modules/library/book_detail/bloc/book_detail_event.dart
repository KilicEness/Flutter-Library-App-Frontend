part of 'book_detail_bloc.dart';

abstract class BookDetailEvent extends Equatable {
  const BookDetailEvent();

  @override
  List<Object> get props => [];
}

class BookDetailFetchEvent extends BookDetailEvent {
  final String userId;
  const BookDetailFetchEvent(this.userId);
}
