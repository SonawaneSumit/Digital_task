import 'package:digital_test/view/Mobile/Profile.dart';
import 'package:digital_test/view/Mobile/carScreen.dart';
import 'package:digital_test/view/Mobile/customNav.dart';
import 'package:digital_test/view/Mobile/homepage_mobile.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _HomePageWithNavbarState();
}

class _HomePageWithNavbarState extends State<MainHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const GroceryHomePage(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
