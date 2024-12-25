

import 'package:booking_management/models/book.dart';
import 'package:booking_management/models/genre.dart';

List<Book> booklists = [
  Book(
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    genres: [
      Genre(name: "Fiction", image: "assets/genres/fiction.png"),
    ],
    coverImage: "assets/greatgatsby.png",
    description: "A tale of love, ambition, and the American Dream.",
    publicationDate: DateTime(1925, 4, 10),
  ),
  Book(
    title: "To Kill a Mockingbird #1",
    author: "Harper Lee",
    genres: [
      Genre(name: "Fiction", image: "assets/genres/fiction.png"),
    ],
    coverImage: "assets/mockingbird.png",
    description: "A classic novel exploring themes of racial injustice.",
    publicationDate: DateTime(1988, 5, 1),
  ),
  Book(
    title: 'Harry Potter #1 Harry Potter and the Sorcerer’s Stone',
    author: 'J.K. Rowling',
    genres: [
      Genre(name: 'Fantasy', image: "assets/genres/fantasy.png"),
    ],
    coverImage: 'assets/hp1.png',
    description: 'The first book in the Harry Potter series.',
    publicationDate: DateTime(1997, 6, 26),
  ),
  Book(
    title: 'The Twilight Saga #1, Twilight',
    author: 'Stephenie Meyer',
    genres: [
      Genre(name: 'Fantasy', image: "assets/genres/fantasy.png"),
    ],
    coverImage: 'assets/twilight.jpg',
    description: 'Introducing Bella Swan and her vampire love interest.',
    publicationDate: DateTime(2005, 10, 5),
  ),
  Book(
    title: 'One Day',
    author: 'David Nicholls',
    genres: [
      Genre(name: 'Romance', image: "assets/genres/romance.png"),
    ],
    coverImage: 'assets/oneday.png',
    description: 'A romantic drama following Emma and Dexter.',
    publicationDate: DateTime(2009, 6, 11),
  ),
  Book(
    title: 'When Breath Becomes Air',
    author: 'Paul Kalanithi',
    genres: [
      Genre(name: 'Non-Fiction', image: "assets/genres/non-fiction.png"),
    ],
    coverImage: 'assets/breathair.png',
    description: 'A memoir reflecting on life and mortality.',
    publicationDate: DateTime(2016, 1, 12),
  ),
  Book(
    title: 'Kill Joy (A Good Girl’s Guide to Murder 5)',
    author: 'Holly Jackson',
    genres: [
      Genre(name: 'Mystery', image: "assets/genres/mystery.png"),
    ],
    coverImage: 'assets/ggm5.png',
    description: 'A prequel novella following Pip Fitz-Amobi.',
    publicationDate: DateTime(2021, 2, 18),
  ),
  Book(
    title: 'A Good Girl’s Guide to Murder 1',
    author: 'Holly Jackson',
    genres: [
      Genre(name: 'Mystery', image: "assets/genres/mystery.png"),
    ],
    coverImage: 'assets/ggm1.png',
    description: 'Pip investigates a closed murder case.',
    publicationDate: DateTime(2019, 5, 2),
  ),
  Book(
    title: 'A Good Girl’s Guide to Murder 2',
    author: 'Holly Jackson',
    genres: [
      Genre(name: 'Mystery', image: "assets/genres/mystery.png"),
    ],
    coverImage: 'assets/ggm2.png',
    description: 'Pip tackles another mystery.',
    publicationDate: DateTime(2020, 4, 30),
  ),
  Book(
    title: 'As Good As Dead (A Good Girl’s Guide to Murder 3)',
    author: 'Holly Jackson',
    genres: [
      Genre(name: 'Mystery', image: "assets/genres/mystery.png"),
    ],
    coverImage: 'assets/ggm3.png',
    description: 'The final installment of the series.',
    publicationDate: DateTime(2021, 8, 5),
  ),
];