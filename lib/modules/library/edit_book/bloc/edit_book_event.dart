part of 'edit_book_bloc.dart';

abstract class EditBookEvent extends Equatable {
  const EditBookEvent();

  @override
  List<Object> get props => [];
}

class EditBookUpdate extends EditBookEvent {
  final String? name;
  final String? author;
  final bool? completed;

  EditBookUpdate({this.name, this.author, this.completed});
}
