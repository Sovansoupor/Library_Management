import 'package:booking_management/models/appTheme.dart';
//import 'package:booking_management/screen/booklist_screen.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const Searchbar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: TColors.primary,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: TColors.primary,
              size: 30,
            ),
            onPressed: () {
              widget.onChanged(widget.controller.text);
            },
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: const InputDecoration(
                hintText: 'Search for your favorite books...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
