
import 'package:flutter/material.dart';
import '../screen/booklist_screen.dart';
import 'package:booking_management/models/app_theme.dart';

class CategoriesScreen extends StatelessWidget {
final List<Map<String, String>> genres = [
    {"name": "Fiction & Fantasy", "image": "assets/4.png"},
    {"name": "Non-Fiction", "image": "assets/5.png"},
    {"name": "Thriller & Mystery", "image": "assets/6.png"},
  ];

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      children: genres.map((genre) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          child: SizedBox(
            width: media.width,
            height: 130,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookListScreen(genre: genre['name']),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: TColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                  side: const BorderSide(
                    color: TColors.grey,
                    width: 0.7,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    genre['name']!,
                    style: TColors.captionStyle,
                  ),
                  Image.asset(
                    genre['image']!,
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}