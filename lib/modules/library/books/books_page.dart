import 'package:library_app/modules/library/books/bloc/books_bloc.dart';
import 'package:library_app/modules/library/books/widgets/book_tile.dart';
import 'package:library_app/shared/widgets/layouts/library_scaffold.dart';
import 'package:flutter/material.dart';
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
        child: BlocBuilder(
          bloc: _booksBloc,
          builder: (context, state) {
            if (state is BooksLoading) {
              return const Text("Books loading...");
            } else if (state is BooksFailure) {
              return Text(state.message);
            } else if (state is BooksSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: state.books
                    .map(
                      (book) => [
                        SizedBox(
                          height:
                              50, // İstediğiniz yüksekliği burada belirleyebilirsiniz
                        ),
                        BookTile(book: book),
                      ],
                    )
                    .expand((pair) => pair)
                    .toList(),
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
