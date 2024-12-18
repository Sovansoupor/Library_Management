import 'package:booking_management/dummy/dummyBook.dart';
import 'package:booking_management/models/appTheme.dart';
import 'package:booking_management/models/book.dart';
import 'package:flutter/material.dart';

class BookCollection extends StatelessWidget {
  const BookCollection({super.key});

  @override
  Widget build(BuildContext context) {
    //final media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 1),
      child: SizedBox(
        height: 50, // Height of the book cards
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: booklists.length, // Use your dummy list
          itemBuilder: (context, index) {
            final book = booklists[index]; // Get the current book
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: BookCard(
                book: book,
              ),
            );
          },
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, left: 1, right: 1),
      width: 160, // Adjusted width for the book card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  book.coverImage,
                  height: 250,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 2, right: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TColors.captionStyle,
                  ),
                  const SizedBox(height: 0.1),
                  Text(
                    "By ${book.author}",
                    style: TColors.authorStyle,
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


      // ),