import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './/shared/widgets/layouts/library_scaffold.dart';

import 'bloc/add_book_bloc.dart';

class AddBookPage extends StatefulWidget {
  final AddBookBloc _addBookBloc = Modular.get<AddBookBloc>();

  AddBookPage({Key? key}) : super(key: key);

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  String? name;
  String? author;
  bool completed = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    completed = false;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('The book has been added successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: 'Add New Book',
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: BlocBuilder<AddBookBloc, AddBookState>(
          bloc: widget._addBookBloc,
          builder: (context, state) {
            if (state is AddBookLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AddBookFailure) {
              return Center(child: Text(state.message));
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Author',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            author = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Author cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Completed',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: completed,
                        onChanged: (value) {
                          setState(() {
                            completed = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget._addBookBloc.add(AddNewBook(
                              name: name!,
                              author: author!,
                              completed: completed,
                              onSuccess: (createdBook) {
                                _showSuccessDialog(); // Modalı göster
                              },
                              onFail: (message) {},
                            ));
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
