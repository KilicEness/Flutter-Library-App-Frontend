import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './/shared/widgets/layouts/library_scaffold.dart';
import 'bloc/edit_profile_bloc.dart';

class EditProfilePage extends StatefulWidget {
  final EditProfileBloc _editProfileBloc = Modular.get<EditProfileBloc>();

  EditProfilePage({Key? key}) : super(key: key) {
    _editProfileBloc.add(const UserProfileFetch());
  }

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // String? name;
  // String? email;
  String? password;
  DateTime? birthDay;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: 'Edit Profile',
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: BlocBuilder<EditProfileBloc, EditProfileState>(
          bloc: widget._editProfileBloc,
          builder: (context, state) {
            if (state is EditProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EditProfileFailure) {
              return Center(child: Text(state.message));
            } else if (state is EditProfileSuccess) {
              _nameController.text = state.user.name;
              _birthDayController.text =
                  state.user.birthDay != null ? state.user.birthDay.toString() : '';
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
                        controller: _nameController,
                        // onChanged: (value) {
                        //   setState(() {
                        //     _nameController.text = value;
                        //   });
                        // },
                      ),
                      const SizedBox(height: 16.0),

                      const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'BirthDay',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _birthDayController,
                        onTap: () async {
                          final DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              birthDay = selectedDate;
                              _birthDayController.text = selectedDate.toString();
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget._editProfileBloc.add(EditProfileUpdate(
                              name: _nameController.text,
                              // email: _nameController.text,
                              password: password!,
                              birthDay: birthDay!,
                            ));
                          }
                        },
                        child: const Text('Edit'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text("nothing");
            }
          },
        ),
      ),
    );
  }
}
