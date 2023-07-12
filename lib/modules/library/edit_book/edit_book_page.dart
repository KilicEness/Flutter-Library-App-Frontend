import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './/shared/widgets/layouts/library_scaffold.dart';
import 'bloc/edit_book_bloc.dart';

class EditBookPage extends StatefulWidget {
  final EditBookBloc _editBookBloc = Modular.get<EditBookBloc>();

  EditBookPage({Key? key}) : super(key: key);

  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  String? name;
  String? author;
  bool? completed;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: 'Edit Book',
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: BlocBuilder<EditBookBloc, EditBookState>(
          bloc: widget._editBookBloc,
          builder: (context, state) {
            if (state is EditBookLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EditBookFailure) {
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
                            completed = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget._editBookBloc.add(EditBookUpdate(
                              name: name!,
                              author: author!,
                              completed: completed!,
                            ));
                          }
                        },
                        child: const Text('Edit'),
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
