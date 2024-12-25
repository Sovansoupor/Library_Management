
import 'package:booking_management/models/borrowStatus.dart';
import 'package:booking_management/models/genre.dart';

class Book {
  final String title;
  final String author;
  final List<Genre> genres;
  String coverImage;
  bool isBorrowed; 
  bool isReserved; 
  DateTime? returnDate; 
  List<BorrowStatus> borrowStatuses; 
  String description; 
  DateTime publicationDate; 

  Book({

    required this.title,
    required this.author,
    required this.genres,
    required this.coverImage,
    this.isBorrowed = false,
    this.isReserved = false,
    this.returnDate,
    this.borrowStatuses = const [],
    required this.description,
    required this.publicationDate,
  });
}