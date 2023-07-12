import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';

import './widgets/my_profile_tile.dart';
import './bloc/my_profile_bloc.dart';
import './/shared/widgets/layouts/library_scaffold.dart';

class MyProfilePage extends StatelessWidget {
  final MyProfileBloc _myProfileBloc = Modular.get<MyProfileBloc>();

  MyProfilePage({Key? key}) : super(key: key) {
    _myProfileBloc.add(const MyProfileFetch());
  }

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: "My Profile Page Title",
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: BlocBuilder<MyProfileBloc, MyProfileState>(
                bloc: _myProfileBloc,
                builder: (context, state) {
                  if (state is MyProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MyProfileFail) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is MyProfileSuccess) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final user = state.user;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: MyProfileTile(user: user),
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
                  ModularNavigator.toPush('/library/editProfile');
              },
              child: const Text('Edit Profile'),
            ),
          ),
        ],
      ),
    );
  }
}
