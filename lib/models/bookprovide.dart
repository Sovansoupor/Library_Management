

import 'package:flutter/material.dart';
import 'package:booking_management/models/book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _borrowedBooks = [];
  List<Book> _reservedBooks = [];

  List<Book> get borrowedBooks => _borrowedBooks;
  List<Book> get reservedBooks => _reservedBooks;

  void borrowBook(Book book) {
    if (!_borrowedBooks.contains(book)) {
      _borrowedBooks.add(book);
      book.isBorrowed = true; // Update the book's status
      notifyListeners(); // Notify listeners to rebuild UI
    }
  }

  void reserveBook(Book book) {
    if (!_reservedBooks.contains(book)) {
      _reservedBooks.add(book);
      book.isReserved = true; 
      notifyListeners(); 
    }
  }

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