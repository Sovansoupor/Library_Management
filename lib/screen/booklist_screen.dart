import 'package:booking_management/models/bookprovide.dart';
import 'package:booking_management/dummy/dummy_book.dart';
import 'package:booking_management/models/app_theme.dart';
import 'package:booking_management/models/book.dart';
import 'package:booking_management/screen/collection_screen.dart';
import 'package:booking_management/widget/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:provider/provider.dart';

class BookListScreen extends StatefulWidget {
  final String? genre;
  final String? searchQuery;

  const BookListScreen({super.key, this.genre, this.searchQuery});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final books = booklists;

    // Split the genre string ("Fiction & Fantasy")
    final genresToFilter = widget.genre != null
        ? widget.genre!.split('&').map((e) => e.trim()).toList()
        : [];

    // Filter books by genre(s) if genre is provided
    final filteredBooks = genresToFilter.isNotEmpty
        ? books.where((book) {
            return book.genres.any((bookGenre) => 
                genresToFilter.contains(bookGenre.name)); // Compare names
          }).toList()
        : books;


    return Scaffold(
      backgroundColor: TColors.background,
      appBar: AppBar(
        title: Text(widget.genre ?? "Books", style: TColors.titleStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollectionScreen(
                          borrowedBooks: bookProvider.borrowedBooks,
                          reservedBooks: bookProvider.reservedBooks,
                        ),
                      ),
                    );
                  },
                  icon: const DecoratedIcon(
                    icon: Icon(
                      Icons.library_add_rounded,
                      size: 30,
                      color: TColors.primary,
                    ),
                    decoration: IconDecoration(border: IconBorder()),
                  ),
                  label: Text('My Collection', style: TColors.captionStyle),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 8.0,
              ),
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return BookCard(
                  book: book,
                  onBorrow: (book) => bookProvider.borrowBook(book),
                  onReserve: (book) => bookProvider.reserveBook(book),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book; 
  final Function(Book) onBorrow;
  final Function(Book) onReserve;

  const BookCard({
    super.key,
    required this.book,
    required this.onBorrow,
    required this.onReserve,
  }); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCustomModal(
          context,
          book,
          onBorrow, 
          onReserve, 
        ); 
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                book.coverImage, 
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title, 
                    style: TColors.booktitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "By ${book.author}",
                    style: TColors.bookauthor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
