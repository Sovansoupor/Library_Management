import 'package:booking_management/models/book.dart';

List<Book> booklists = [
  Book(
    title: 'The Twilight Saga #1, Twilight',
    author: 'Stephenie Meyer',
    genres: ['Fantasy', 'Fiction'],
    publicationDate: DateTime(2005, 10, 5),
    coverImage: 'assets/twilight.jpg',
    isBorrowed: false,
    isReserved: true,
    description: '',
    returnDate: null, // Not borrowed
  ),
  Book(
    title: 'One day',
    author: 'David Nicholls',
    genres: ['Romance', 'Fiction'],
    publicationDate: DateTime(2009, 6, 11),
    coverImage: 'assets/oneday.png',
    isBorrowed: false,
    isReserved: false,
    description: '',
    returnDate: null, // Not borrowed
  ),
  Book(
    title: 'When breath becomes air',
    author: 'Paul Kalanithi',
    genres: ['Non-Fiction'],
    publicationDate: DateTime(2016, 1, 12),
    coverImage: 'assets/breathair.png',
    isBorrowed: true,
    isReserved: false,
    description: '',
    returnDate: DateTime.now().add(const Duration(days: 14)), // Book borrowed, 14 days from now
  ),
  Book(
    title: 'Kill Joy (A Good Girl’s Guide to Murder 5)',
    author: 'Holly Jackson',
    genres: ['Mystery', 'Fiction', 'Thriller'],
    publicationDate: DateTime(2021, 2, 18),
    coverImage: 'assets/ggm5.png',
    isBorrowed: false,
    isReserved: true,
    description: '',
    returnDate: null, // Not borrowed
  ),
  Book(
    title: 'A Good Girl’s Guide to Murder 1',
    author: 'Holly Jackson',
    genres: ['Mystery', 'Fiction', 'Thriller'],
    publicationDate: DateTime(2019, 5, 2),
    coverImage: 'assets/ggm1.png',
    isBorrowed: false,
    isReserved: false,
    description: '',
    returnDate: null, // Not borrowed
  ),
  Book(
    title: 'A Good Girl’s Guide to Murder 2',
    author: 'Holly Jackson',
    genres: ['Mystery', 'Fiction', 'Thriller'],
    publicationDate: DateTime(2020, 4, 30),
    coverImage: 'assets/ggm2.png',
    isBorrowed: false,
    isReserved: false,
    description: '',
    returnDate: null, // Not borrowed
  ),
  Book(
    title: 'As Good As Dead (A Good Girl’s Guide to Murder 3)',
    author: 'Holly Jackson',
    genres: ['Mystery', 'Fiction', 'Thriller'],
    publicationDate: DateTime(2021, 8, 5),
    coverImage: 'assets/ggm3.png',
    isBorrowed: true,
    isReserved: false,
    description: '',
    returnDate: DateTime.now().add(Duration(days: 14)), // Book borrowed, 14 days from now
  ),
  Book(
    title: 'Harry Potter #1 Harry Potter and the Sorcerer’s Stone',
    author: 'J.K. Rowling',
    genres: ['Fantasy', 'Fiction'],
    publicationDate: DateTime(1997, 6, 26),
    coverImage: 'assets/hp1.png',
    isBorrowed: false,
    isReserved: false,
    description: '',
    returnDate: null, // Not borrowed
  ),
  Book(
    title: 'To Kill a Mockingbird #1',
    author: 'Harper Lee',
    genres: ['Fiction'],
    publicationDate: DateTime(1988, 5, 1),
    coverImage: 'assets/mockingbird.png',
    isBorrowed: false,
    isReserved: false,
    description: '',
    returnDate: null, // Not borrowed
  ),
  Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald,Jesmyn Ward',
    genres: ['Fiction'],
    publicationDate: DateTime(1925, 4, 10),
    coverImage: 'assets/greatgatsby.png',
    isBorrowed: false,
    isReserved: false,
    description: '',
    returnDate: null, // Not borrowed
  ),
];
