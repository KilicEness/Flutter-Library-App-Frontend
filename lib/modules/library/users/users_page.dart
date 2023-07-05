import 'package:library_app/modules/library/users/bloc/users_bloc.dart';
import 'package:library_app/modules/library/users/widgets/user_tile.dart';
import 'package:library_app/shared/widgets/layouts/library_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersPage extends StatelessWidget {
  final UsersBloc _usersBloc = Modular.get<UsersBloc>()..add(UsersFetch());

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
              return const Text("Users loading...");
            } else if (state is UsersFailure) {
              return Text(state.message);
            } else if (state is UsersSuccess) {
              state.users.sort((a, b) => a.name.compareTo(b.name)); // Kullanıcıları isimlerine göre sırala
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
