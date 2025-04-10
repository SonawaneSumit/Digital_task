import 'package:digital_test/view/Mobile/homepage_mobile.dart';
import 'package:digital_test/view/Mobile/mainHomePage.dart';
import 'package:digital_test/view/homepage_Web.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Platform E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage_Web(),
      home: HomePageWithNavbar(),
    );
  }
}
