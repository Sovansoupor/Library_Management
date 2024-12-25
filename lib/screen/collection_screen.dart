
import 'package:booking_management/models/bookprovide.dart';
import 'package:booking_management/models/app_theme.dart';
import 'package:booking_management/models/book.dart';
import 'package:booking_management/widget/book_detail.dart';
import 'package:booking_management/widget/borrow_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionScreen extends StatefulWidget {
  final List<Book> borrowedBooks;
  final List<Book> reservedBooks;

  const CollectionScreen({
    super.key,
    required this.borrowedBooks,
    required this.reservedBooks,
  });

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  // Borrow a book using the provider
  void _borrowBook(Book book) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    bookProvider.borrowBook(book);
  }

  // Reserve a book using the provider
  void _reserveBook(Book book) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    bookProvider.reserveBook(book);
  }

  // Show the modal with book details
  void _showBookDetailsModal(Book book) {
    showCustomModal(
      context,
      book,
      _borrowBook, // Pass the callback
      _reserveBook, 
    );
  }

  // Function to remove a borrowed book
  void _removeBorrowedBook(Book book) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    bookProvider.removeBorrowedBook(book);
  }

  // Function to remove a reserved book
  void _removeReservedBook(Book book) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    bookProvider.removeReservedBook(book);
  }

  // Show a confirmation dialog for removing a book
  void _showRemoveConfirmationDialog(Book book, bool isBorrowed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: Text(isBorrowed
              ? 'Do you want to return the borrowed book?'
              : 'Do you want to cancel the reservation?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (isBorrowed) {
                  _removeBorrowedBook(book);
                } else {
                  _removeReservedBook(book);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Collection', style: TColors.titleStyle),
      ),
      body: ListView.builder(
        itemCount: widget.borrowedBooks.length + widget.reservedBooks.length,
        itemBuilder: (context, index) {
          Book book = index < widget.borrowedBooks.length
              ? widget.borrowedBooks[index]
              : widget.reservedBooks[index - widget.borrowedBooks.length];

          return GestureDetector(
            onTap: () => _showBookDetailsModal(book),
            onLongPress: () => _showRemoveConfirmationDialog(
                book, index < widget.borrowedBooks.length),
            child: CollectionCard(book: book),
          );
        },
      ),
    );
  }
}
