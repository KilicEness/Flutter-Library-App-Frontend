import 'package:flutter/material.dart';
import 'package:library_app/shared/models/user.dart';

class UserDetailTile extends StatelessWidget {
  final UserModel user;
  const UserDetailTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('User Name: ${user.name}'),
        Text('User Email: ${user.email}'),
        Text('User Birthday: ${user.birthDay}'),
      ],
    );
  }
}