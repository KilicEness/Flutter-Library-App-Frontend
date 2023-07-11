import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './/shared/models/user.dart';

class MyProfileTile extends StatelessWidget {
  final UserModel user;

  const MyProfileTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createdAtDate = DateTime.parse(user.createdAt);
    final formattedDate = DateFormat.yMMMMd().format(createdAtDate);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(user.name),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(user.email),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text(
              'Created At',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(formattedDate),
          ),
        ],
      ),
    );
  }
}
