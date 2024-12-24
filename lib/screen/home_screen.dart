// import 'package:booking_management/bookprovide.dart';
// import 'package:booking_management/models/appTheme.dart';
// import 'package:booking_management/models/book.dart';
// import 'package:booking_management/screen/book_recommend.dart';
// import 'package:booking_management/screen/collection_screen.dart';
// import 'package:booking_management/widget/custom_appbar.dart';
// import 'package:booking_management/widget/borrow_card.dart';
// import 'package:booking_management/widget/genre_filtered.dart';
// import 'package:intl/intl.dart';


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {


//   String currentDate = DateFormat('dd MMM').format(DateTime.now());


  
//   final Book exampleBook = Book(
//     title: "Harry Potter",
//     author: "James Jen",
//     coverImage: "assets/hp1.png", 
//     isBorrowed: false,
//     isReserved: false, genres: [], publicationDate: DateTime(1999,2,3), description: '',
//   );

//   @override
//   Widget build(BuildContext context) {
//       final bookProvider = Provider.of<BookProvider>(context);
//     final media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: TColors.background,
//       body:
//        Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//           const CustomAppBar(), 
//            Expanded(
//              child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     alignment: Alignment.topCenter,
//                     children: [
//                       // 1 - Accent Circular bg
//                       Align(
//                         child: Container(
//                           width: media.width,
//                           height: media.width * 0.45,
//                           decoration: const BoxDecoration(
//                             color: TColors.primary,
//                             //borderRadius: BorderRadius.circular(media.width * 0.079),
//                           ),
//                         ),
//                       ),
              
//                       // 2 - Home View
//                       Padding(
//                         padding:
//                             const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CollectionCard(book: exampleBook, onIconPressed: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>CollectionScreen(borrowedBooks: borrowedBooks, reservedBooks: reservedBooks )));
//                             },),
//                             const SizedBox(height: 20),
//                             Text('Choose Your Escape', style: TColors.titleStyle),
//                             const SizedBox(height: 6),
//                             CategoriesScreen(),
//                             const SizedBox(height: 5),
//                             SizedBox(
//                                 height: media.width * 0.73,
//                                 child: const BookCollection()),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//            ),
//          ],
//        ),
//     );
//   }
// }
import 'package:booking_management/bookprovide.dart';
import 'package:booking_management/models/appTheme.dart';
import 'package:booking_management/models/book.dart';
import 'package:booking_management/screen/book_recommend.dart';
import 'package:booking_management/screen/collection_screen.dart';
import 'package:booking_management/widget/custom_appbar.dart';
import 'package:booking_management/widget/borrow_card.dart';
import 'package:booking_management/widget/genre_filtered.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String currentDate = DateFormat('dd MMM').format(DateTime.now());

  final Book exampleBook = Book(
    title: "Harry Potter",
    author: "James Jen",
    coverImage: "assets/hp1.png",
    isBorrowed: false,
    isReserved: false,
    genres: [],
    publicationDate: DateTime(1999, 2, 3),
    description: '',
  );

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // 1 - Accent Circular Background
                      Align(
                        child: Container(
                          width: media.width,
                          height: media.width * 0.45,
                          decoration: const BoxDecoration(
                            color: TColors.primary,
                          ),
                        ),
                      ),
                      // 2 - Home View
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CollectionCard(
                              book: exampleBook,
                              onIconPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CollectionScreen( 
                                      borrowedBooks: bookProvider.borrowedBooks, 
                              reservedBooks: bookProvider.reservedBooks
                              ) ,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            Text('Choose Your Escape', style: TColors.titleStyle),
                            const SizedBox(height: 6),
                            CategoriesScreen(),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: media.width * 0.73,
                              child: const BookCollection(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
