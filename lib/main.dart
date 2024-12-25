import 'package:booking_management/models/bookprovide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/bottom_navigation.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BookProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Library App',
      home: BottomNavigationBarWidget(),
    );
  }
}
