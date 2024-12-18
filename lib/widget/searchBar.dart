import 'package:booking_management/models/appTheme.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Example Filter Option 1
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('By Category'),
                onTap: () {
                  // Add logic for "By Category"
                },
              ),
              // Example Filter Option 2
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('By Ratings'),
                onTap: () {
                  // Add logic for "By Ratings"
                },
              ),
              // Example Filter Option 3
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('By Date'),
                onTap: () {
                  // Add logic for "By Date"
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: TColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: TColors.primary,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.search,
                color: TColors.primary,
              ),
              onPressed: () {}),
          const SizedBox(width: 1),
          const Expanded(
            child: Text(
              'Search for your favorite books...',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          IconButton(
            iconSize: 30,
            icon: const Icon(
              Icons.filter_list,
              color: TColors.primary,
            ),
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
    );
  }
}
