import 'package:booking_management/models/appTheme.dart';
import 'package:booking_management/screen/booklist_screen.dart';
import 'package:booking_management/screen/home_screen.dart';
import 'package:booking_management/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class BotttomNagivationBar extends StatefulWidget {
  const BotttomNagivationBar({super.key});

  @override
  _BotttomNagivationBarState createState() => _BotttomNagivationBarState();
}

class _BotttomNagivationBarState extends State<BotttomNagivationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
     const BookListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final book = books[index];

    return Scaffold(
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: TColors.primary,  size: 30),
              label: 'Home',
             backgroundColor: TColors.background,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined,color: TColors.primary,  size: 30),
              label: 'Books',
             backgroundColor: TColors.background,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, color: TColors.primary, size: 30),
              label: 'Profile',
             backgroundColor: TColors.background,
            ),
          ],
          
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: TColors.secondary),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
          unselectedIconTheme: const IconThemeData(color: TColors.primary,
        ),
        ),
    );
  }
}
