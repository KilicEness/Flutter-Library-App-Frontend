import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './bloc/books_bloc.dart';
import 'widgets/books_tile.dart';
import './/shared/widgets/layouts/library_scaffold.dart';

class BooksPage extends StatelessWidget {
  final BooksBloc _booksBloc = Modular.get<BooksBloc>()..add(const BooksFetch());

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
              state.books.sort((a, b) =>
                  a.name.compareTo(b.name)); // Kitapları isimlerine göre sırala
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
