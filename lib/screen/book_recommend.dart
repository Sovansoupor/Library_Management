import 'package:booking_management/dummy/dummy_book.dart';
import 'package:booking_management/models/app_theme.dart';
import 'package:booking_management/models/book.dart';
import 'package:booking_management/screen/booklist_screen.dart';
import 'package:booking_management/widget/book_detail.dart';
import 'package:flutter/material.dart';

class BookCollection extends StatefulWidget {
  const BookCollection({super.key});

  @override
  State<BookCollection> createState() => _BookCollectionState();
}

class _BookCollectionState extends State<BookCollection> {
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
    final media = MediaQuery.of(context).size;
    final itemWidth = media.width * 0.36;

// Navigate to BookList
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Text(
                "Recommended Books",
                style: TColors.titleStyle,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookListScreen()));
                },
                child: Text(
                  "See All",
                  style: TColors.buttonStyle,
                ),
              ),
            ],
          ),

// Horizontal ListView - Bottom Modal
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: booklists.length, 
              itemBuilder: (context, index) {
                final book = booklists[index]; 
                return Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: GestureDetector(
                    onTap: () {
                      showCustomModal(
                        context,
                        book,
                        _borrowBook, 
                        _reserveBook, 
                      );
                    },
                    child: BookCard(
                      book: book,
                      itemWidth: itemWidth, 
                    ),
                  ),
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
  final double itemWidth; 
  const BookCard({
    super.key,
    required this.book,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      width: itemWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: ClipRRect(
                child: Image.asset(
                  book.coverImage,
                  height: itemWidth * 1.5, 
                  width: itemWidth, 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
