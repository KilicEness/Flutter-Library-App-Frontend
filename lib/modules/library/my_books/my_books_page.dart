// page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_app/shared/helpers/local_storage.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';

import './widgets/my_books_tile.dart';
import './bloc/my_books_bloc.dart';
import './/shared/widgets/layouts/library_scaffold.dart';

class MyBooksPage extends StatelessWidget {
  
  final MyBooksBloc _myBooksBloc = Modular.get<MyBooksBloc>();

  MyBooksPage({Key? key}) : super(key: key) {
    _myBooksBloc.add(MyBooksFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: "My Books Page Title",
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocBuilder<MyBooksBloc, MyBooksState>(
                bloc: _myBooksBloc,
                builder: (context, state) {
                  if (state is MyBooksLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MyBooksFail) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is MyBooksSuccess) {
                    return ListView.builder(
                      itemCount: state.myBooks.length,
                      itemBuilder: (context, index) {
                        final book = state.myBooks[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: MyBooksTile(book: book),
                        );
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                  ModularNavigator.toPush("/library/books/create");
              },
              child: const Text('Add Book'),
            ),
          ),
        ],
      ),
    );
  }
}
