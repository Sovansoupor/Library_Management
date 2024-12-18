import 'package:booking_management/models/appTheme.dart';
// import 'package:booking_management/screen/collection/book_collection.dart';
import 'package:booking_management/widget/appBar.dart';
import 'package:booking_management/widget/searchBar.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentDate = DateFormat('dd MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // 1 - Accent Circular bg
              Align(
                child: Container(
                  width: media.width,
                  height: media.width * 0.7,
                  decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius: BorderRadius.circular(media.width * 0.079),
                  ),
                ),
              ),

              // 2 - Home View
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomAppBar(), // Custom App Bar
                    const SizedBox(height: 30),
                    const Searchbar(), // Search Bar
                    const SizedBox(height: 10),

                    // 
                    const Divider(),

                    Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      width: media.height,
                      height: 160,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Text('My Books', style: TColors.titleStyle),
                          Text('data')
                        ],
                      ),
                      

                    ),
                   )


                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

                    // Align(
                    //   child: Container(
                    //     width: media.width,
                    //     height: media.width * 0.66,
                    //     decoration: BoxDecoration(
                    //       color: TColors.background,
                    //       borderRadius:
                    //           BorderRadius.circular(media.width * 0.02),
                    //       border: Border.all(
                    //         color: TColors.primary,
                    //         width: 1.0,
                    //       ),
                    //     ),
                    //     child:  
                    //       const BookCollection(),
                    //      // Display book collection
                    //   ),
                    // ),


                    //heading of BookCollection
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 3),
                    //       child: Text(
                    //         'Trending Now',
                    //         style: TColors.titleStyle,
                    //       ),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         'See all',
                    //         style: TColors.buttonStyle,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(height: 0.01),
                    // // Container for Bookcollection
                    // SizedBox(
                    //   height: media.width * 0.75,
                    //   child: const BookCollection(),
                    // ),