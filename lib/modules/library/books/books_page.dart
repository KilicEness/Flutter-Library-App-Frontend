import 'package:flutter/material.dart';
import 'package:library_app/modules/library/books/models/book.dart';
import 'package:library_app/modules/library/books/bloc/books_bloc.dart';
import 'package:library_app/modules/library/books/widgets/book_tile.dart';
import 'package:library_app/shared/widgets/layouts/library_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BooksPage extends StatelessWidget {
  final BooksBloc _booksBloc = Modular.get<BooksBloc>()..add(BooksFetch());

  BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: "Books Page Title",
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: BlocBuilder<BooksBloc, BooksState>(
          bloc: _booksBloc,
          builder: (context, state) {
            if (state is BooksLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BooksFailure) {
              return Text(state.message);
            } else if (state is BooksSuccess) {
              state.books.sort((a, b) => a.name.compareTo(b.name)); // Kitapları isimlerine göre sırala
              return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: BookTile(book: book),
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
