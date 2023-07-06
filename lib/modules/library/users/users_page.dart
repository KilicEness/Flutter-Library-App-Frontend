import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './bloc/users_bloc.dart';
import './widgets/users_tile.dart';
import './/shared/widgets/layouts/library_scaffold.dart';

class UsersPage extends StatelessWidget {
  final UsersBloc _usersBloc = Modular.get<UsersBloc>()..add(const UsersFetch());

  UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: "Users Page Title",
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: BlocBuilder<UsersBloc, UsersState>(
          bloc: _usersBloc,
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UsersFailure) {
              return Text(state.message);
            } else if (state is UsersSuccess) {
              state.users.sort((a, b) => a.name
                  .compareTo(b.name)); // Kullanıcıları isimlerine göre sırala
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: UserTile(user: user),
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
