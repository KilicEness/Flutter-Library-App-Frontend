import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_app/modules/library/user_detail/bloc/user_detail_bloc.dart';
import 'package:library_app/modules/library/user_detail/widgets/user_detail_tile.dart';
import 'package:library_app/shared/models/user.dart';
import 'package:library_app/shared/widgets/layouts/library_scaffold.dart';

class UserDetailPage extends StatelessWidget {
  final String userId;
  final UserDetailBloc _userDetailBloc = Modular.get<UserDetailBloc>();
 
  UserDetailPage({Key? key, required this.userId}) : super(key: key) {
    _userDetailBloc.add(UserDetailFetch(userId));
  }

  @override
  Widget build(BuildContext context) {
    return LibraryScaffold(
      title: "User Detail Page Title",
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: BlocBuilder<UserDetailBloc, UserDetailState>(
          bloc: _userDetailBloc,
          builder: (context, state) {
            if (state is UserDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserDetailFail) {
              return Center(child: Text(state.errorMessage));
            } else if (state is UserDetailSuccess) {
               return ListView.builder(
                itemCount: 1,
                 itemBuilder: (context, index) {
                   final user = state.userDetail;
                   return Padding(
                     padding: const EdgeInsets.only(bottom: 16.0),
                     child: UserDetailTile(user: user),
                   );
                 },
               );
              // return Text(state.userDetail.name);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}