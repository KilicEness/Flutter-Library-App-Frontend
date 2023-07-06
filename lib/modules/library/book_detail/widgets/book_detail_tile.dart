import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/book_detail.dart';

class BookDetailTile extends StatelessWidget {
  final BookDetailModel book;

  const BookDetailTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createdAtDate = DateTime.parse(book.createdAt);
    final formattedCreateDate = DateFormat.yMMMMd().format(createdAtDate);

    final updatedAtDate = DateTime.parse(book.updatedAt);
    final formattedUpdateDate = DateFormat.yMMMMd().format(updatedAtDate);

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
            Text(
              book.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Author: ${book.author}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Completed: ${book.completed}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Created At: $formattedCreateDate',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Updated At: $formattedUpdateDate',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
