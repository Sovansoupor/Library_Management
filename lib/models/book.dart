class Book {
  final String title;
  final String author;
  final String genre;
  final String coverImage;
  final DateTime publicationDate;
  bool isBorrowed;
  bool isReserved;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.coverImage,
    required this.publicationDate,
    this.isReserved = false,
    this.isBorrowed = false,
  });

  void borrowBook(Book book) {
    if (!book.isBorrowed) {
      book.isBorrowed = true;
      // Handle additional logic, like updating the UI or saving the state
    }
  }

  void reserveBook(Book book) {
    if (!book.isReserved && !book.isBorrowed) {
      book.isReserved = true;
      // Handle additional logic, like updating the UI or saving the state
    }
  }
}
