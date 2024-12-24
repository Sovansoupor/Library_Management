import 'package:booking_management/models/appTheme.dart';
import 'package:booking_management/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String currentDate = DateFormat('dd MMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TColors.primary,
      elevation: 2.5,
      title: Container(
        alignment: Alignment.centerLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: "Soupor",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Today $currentDate", // Display dynamic date
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
      ),
      
      leading: GestureDetector(
        onTap: () {
          // Navigate to ProfileScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:10),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu, size: 25,color: Colors.white,)),
        )
      ],
    );
  }
}

        // child: const CircleAvatar(
        //   radius: 10, // Adjust size to fit AppBar
        //   backgroundImage: AssetImage("assets/meow.jpg"),
        // ),