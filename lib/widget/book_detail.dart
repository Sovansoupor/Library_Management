import 'package:booking_management/models/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:booking_management/models/book.dart'; // Adjust import based on your project structure
import 'package:booking_management/screen/borrow_screen.dart'; // Adjust import based on your project structure

void showCustomModal(
  BuildContext context,
  Book book,
  Function(Book) onBorrow,
  Function(Book) onReserve,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => BookDetails(
      book: book,
      onBorrow: onBorrow,
      onReserve: onReserve,
    ), // Pass the book to BookDetails
  );
}

class BookDetails extends StatefulWidget {
  final Book book;
  final Function(Book) onBorrow;
  final Function(Book) onReserve;

  const BookDetails({
    super.key,
    required this.book,
    required this.onBorrow,
    required this.onReserve,
  });

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(
                widget.book.coverImage,
                height: 200,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.book.title,
              style: TColors.titleStyle.copyWith(
                letterSpacing: -0.5, // Reduce space between letters
                height: 1.2, // Adjust line height (line spacing)
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Author: ${widget.book.author}",
              style: TColors.authorStyle.copyWith(
                letterSpacing: -0.5, // Reduce space between letters
                height: 1.2, // Adjust line height (line spacing)
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "Genre: ${widget.book.genres}",
              style: TColors.authorStyle.copyWith(
                letterSpacing: -0.5, // Reduce space between letters
                height: 1.2, // Adjust line height (line spacing)
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.book.isBorrowed ? "Status: Borrowed" : "Status: Available",
              style: TColors.captionStyle.copyWith(
                fontSize: 16,
                color: widget.book.isBorrowed
                    ? const Color(0xffFA4659)
                    : const Color(0xff40A578),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(width: 0.3),
                  ),
                  onPressed: () {
                    if (widget.book.isBorrowed) {
                      _reserveBook(context);
                      widget.onReserve(widget.book); // Trigger the onReserve callback
                    } else {
                      _borrowBook(context);
                       widget.onBorrow(widget.book);
                    }
                  },
                  child: Text(
                    widget.book.isBorrowed ? "Reserve for later" : "Borrow",
                    style: TColors.buttonStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _borrowBook(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BorrowScreen(
          bookTitle: widget.book.title,
          onSuccess: () {
            setState(() {
              
            widget.book.isBorrowed = true; // Update the book status
            });
          },
          isReservation: false, // Indicate that this action is borrowing
        ),
      ),
    );
  }

  void _reserveBook(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Reservation', style: TColors.captionStyle),
          content: Text("Are you sure you want to reserve '${widget.book.title}'?",
              style: TColors.buttonStyle),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Call createReservation and handle success/failure
                bool success = await createReservation(widget.book.title);
                Navigator.of(context).pop(); // Close the dialog

                if (success) {
                  setState(() {
                  widget.book.isReserved = true; // Close the BorrowScreen
                    
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content:Text("Successfully reserved '${widget.book.title}'.")),
                  );
                  Navigator.of(context).popUntil((route) => route.isFirst);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed to complete the reservation. Please try again.")),
                  );
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
