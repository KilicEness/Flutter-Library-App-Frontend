import 'package:flutter/material.dart';
import 'package:library_app/modules/library/books/models/book.dart';
import 'package:library_app/modules/library/user_detail/user_detail_page.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';

class BookTile extends StatelessWidget {
  final BookModel book;

  const BookTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Owner',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  book.ownerName,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  book.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Author',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  book.author,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                      ModularNavigator.toPush("/library/users/${book.ownerId}");
                  },
                  icon: const Icon(Icons.account_circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
