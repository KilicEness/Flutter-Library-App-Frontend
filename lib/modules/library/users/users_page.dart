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
        child: BlocBuilder(
          bloc: _usersBloc,
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Text("Users loading...");
            } else if (state is UsersFailure) {
              return Text(state.message);
            } else if (state is UsersSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: state.users
                    .map(
                      (user) => [
                        SizedBox(
                          height:
                              50, // İstediğiniz yüksekliği burada belirleyebilirsiniz
                        ),
                        UserTile(user: user),
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
