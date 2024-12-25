import 'package:booking_management/dummy/dummy_book.dart'; // Assuming your list of books is here
import 'package:booking_management/models/app_theme.dart';
import 'package:booking_management/models/book.dart';
import 'package:booking_management/screen/booklist_screen.dart';
import 'package:booking_management/widget/search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Book> _filteredBooks = []; // List to hold the filtered books

  @override
  void initState() {
    super.initState();
    _filteredBooks = [];
  }

  // Method to filter books based on search input
  void _filterBooks(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredBooks = booklists; 
      });
    } else {
      setState(() {
        _filteredBooks = booklists.where((book) {
          final titleLower = book.title.toLowerCase();
          final authorLower = book.author.toLowerCase();
          final genresLower = book.genres.join(' ').toLowerCase();
          final queryLower = query.toLowerCase();
          
// Check if the query matches title, author, or genres
          return titleLower.contains(queryLower) ||
              authorLower.contains(queryLower) ||
              genresLower.contains(queryLower);
        }).toList();
      });
    }
  }

  List<Book> borrowedBooks = [];
  List<Book> reservedBooks = [];

  // Method for borrowing a book
  void _borrowBook(Book book) {
    setState(() {
      borrowedBooks.add(book);
    });
  }

  // Method for reserving a book
  void _reserveBook(Book book) {
    setState(() {
      reservedBooks.add(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search', style: TColors.titleStyle),
            const SizedBox(height: 10),

            Searchbar(
              controller: _searchController,
              onChanged: _filterBooks, 
            ),
            const SizedBox(height: 20),
            Flexible(

              child: _searchController.text.isEmpty && _filteredBooks.isEmpty
              ? Container()
              : _filteredBooks.isEmpty
                  ? const Center(child: Text('No books found, try searching again.'))
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 15.0,
                      ),
                      itemCount: _filteredBooks.length, 
                      itemBuilder: (context, index) {
                        final book = _filteredBooks[index];
                        return BookCard(book: book, onBorrow:_borrowBook, onReserve: _reserveBook,); 
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
