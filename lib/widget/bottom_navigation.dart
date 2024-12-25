import 'package:booking_management/models/app_theme.dart';
import 'package:booking_management/screen/booklist_screen.dart';
import 'package:booking_management/screen/home_screen.dart';
//import 'package:booking_management/screen/profile_screen.dart';
import 'package:booking_management/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const BookListScreen(),
    //const ProfileScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: DecoratedIcon(
              icon: Icon(
                Icons.home_rounded,
                color: _selectedIndex == 0 ? TColors.primary : Colors.white,
                size: 30,
              ),
              decoration: const IconDecoration(border: IconBorder()),
            ),
            label: 'Home',
            backgroundColor: TColors.background,
          ),
          BottomNavigationBarItem(
            icon: DecoratedIcon(
              icon: Icon(
                Icons.library_books_rounded,
                color: _selectedIndex == 1 ? TColors.primary : Colors.white,
                size: 30,
              ),
              decoration: const IconDecoration(border: IconBorder()),
            ),
            label: 'Books',
            backgroundColor: Colors.white,
          ),

          BottomNavigationBarItem(
            icon: DecoratedIcon(
              icon: Icon(
                Icons.search_rounded,
                color: _selectedIndex == 2 ? TColors.primary : Colors.white,
                size: 30,
              ),
              decoration: const IconDecoration(border: IconBorder()),
            ),
            label: 'Search',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: TColors.darkbg,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
