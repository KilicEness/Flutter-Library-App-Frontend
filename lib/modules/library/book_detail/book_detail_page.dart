//page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../book_detail/bloc/book_detail_bloc.dart';
import '../book_detail/widgets/book_detail_tile.dart';
import './/shared/widgets/layouts/library_scaffold.dart';

class BookDetailPage extends StatelessWidget {
  final String userId;
  final BookDetailBloc _bookDetailBloc = Modular.get<BookDetailBloc>();

  BookDetailPage({Key? key, required this.userId}) : super(key: key) {
    _bookDetailBloc.add(BookDetailFetchEvent(userId));
  }

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: "Book Detail Page Title",
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: BlocBuilder<BookDetailBloc, BookDetailState>(
          bloc: _bookDetailBloc,
          builder: (context, state) {
            if (state is BookDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookDetailFail) {
              return Center(child: Text(state.errorMessage));
            } else if (state is BookDetailSuccess) {
              return ListView.builder(
                itemCount: state.bookDetail.length,
                itemBuilder: (context, index) {
                  final book = state.bookDetail[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: BookDetailTile(book: book),
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
