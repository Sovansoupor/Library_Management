class BookStatus {
  final bool isBorrowed;
  final bool isReserved;
  final DateTime? borrowDate; 
  final DateTime? returnDate; 

  BookStatus({
    this.isBorrowed = false,
    this.isReserved = false,
    this.borrowDate,
    this.returnDate,
  });
}
