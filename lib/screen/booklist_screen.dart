import 'package:booking_management/dummy/dummyBook.dart';
import 'package:flutter/material.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = booklists;  // Get the dummy data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text('${book.author}\n${book.genre}'),
            trailing: Column(
              children: [
                Icon(
                  book.isBorrowed
                      ? Icons.book_online
                      : Icons.book,
                  color: book.isBorrowed ? Colors.green : Colors.grey,
                ),
                Text(book.isReserved ? 'Reserved' : 'Available'),
              ],
            ),
            onTap: () {
              // Handle tapping a book (e.g., borrow/reserve logic)
            },
          );
        },
      ),
    );
  }
}

