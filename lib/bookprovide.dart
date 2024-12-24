import 'package:flutter/material.dart';
import 'package:booking_management/models/book.dart';

class BookProvider with ChangeNotifier {
  // State for borrowed and reserved books
  final List<Book> _borrowedBooks = [];
  final List<Book> _reservedBooks = [];

  // Getters for accessing the state
  List<Book> get borrowedBooks => _borrowedBooks;
  List<Book> get reservedBooks => _reservedBooks;

  // Method to borrow a book
  void borrowBook(Book book) {
    _borrowedBooks.add(book);
    book.isBorrowed = true;
    notifyListeners(); // Notify listeners to rebuild UI
  }

  // Method to reserve a book
  void reserveBook(Book book) {
    _reservedBooks.add(book);
    book.isReserved = true;
    notifyListeners(); 
  }

  // Optional: Method to remove a book (e.g., for returning or canceling)
  void removeBorrowedBook(Book book) {
    _borrowedBooks.remove(book);
    book.isBorrowed = false;
    notifyListeners();
  }

  void removeReservedBook(Book book) {
    _reservedBooks.remove(book);
    book.isReserved = false;
    notifyListeners();
  }
}
