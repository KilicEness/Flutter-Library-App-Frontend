import 'package:flutter/material.dart';
import 'package:library_app/shared/models/user.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  
  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(width: 200.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(width: 100.0),
            IconButton(
              onPressed: () {
                // Butona tıklandığında yapılacak işlemler buraya gelebilir
              },
              icon: Icon(Icons.book_rounded),
            ),
          ],
        ),
      ),
    );
  }
}