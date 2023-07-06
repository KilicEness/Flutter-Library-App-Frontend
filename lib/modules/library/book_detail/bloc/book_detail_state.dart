part of 'book_detail_bloc.dart';

abstract class BookDetailState extends Equatable {
  const BookDetailState();

  @override
  List<Object> get props => [];
}

class BookDetailInitial extends BookDetailState {}

class BookDetailSuccess extends BookDetailState {
  final List<BookDetailModel> bookDetail;
  const BookDetailSuccess({
    required this.bookDetail
  });
}

class BookDetailFail extends BookDetailState {
  final String errorMessage;
  const BookDetailFail({required this.errorMessage});
}

class BookDetailLoading extends BookDetailState {}
