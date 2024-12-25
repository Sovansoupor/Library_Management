class BorrowStatus {
  final bool isBorrowed;
  final bool isReserved;
  final DateTime? returnDate; 
  final DateTime borrowDate; 
  final DateTime timestamp; 

  BorrowStatus({
    required this.isBorrowed,
    required this.isReserved,
    this.returnDate,
    required this.borrowDate,
    required this.timestamp,
  });
}
