
class Book {
  final String title;
  final String author;
  final List<String> genres;
  final String coverImage;
  final String description;
  final DateTime publicationDate;
  //DateTime? borrowedDate;
  DateTime? returnDate;
  bool isBorrowed;
  bool isReserved;

  Book({
    required this.title,
    required this.author,
    required this.genres,
    required this.coverImage,
    required this.publicationDate,
    required this.description,
    //this.borrowedDate,
    this.returnDate,
    this.isReserved = false,
    this.isBorrowed = false,
  });

  void borrowBook(DateTime borrowedDate, DateTime returnDate) {
    if (!isBorrowed) {
      isBorrowed = true;
     // this.borrowedDate = borrowedDate;
      this.returnDate = returnDate;
    }
  }

  void reserveBook() {
    if (!isReserved && !isBorrowed) {
      isReserved = true;
    }
  }

  int get daysLeft {
    if (returnDate == null) return 0;
    return returnDate!.difference(DateTime.now()).inDays;
  }
}
