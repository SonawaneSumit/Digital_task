import 'package:digital_test/view/Mobile/customNav.dart';
import 'package:digital_test/view/Mobile/homepage_mobile.dart';
import 'package:flutter/material.dart';

class HomePageWithNavbar extends StatefulWidget {
  const HomePageWithNavbar({super.key});

  @override
  State<HomePageWithNavbar> createState() => _HomePageWithNavbarState();
}

class _HomePageWithNavbarState extends State<HomePageWithNavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const GroceryHomePage(),
    const Center(child: Text("Cart")),
    const Center(child: Text("Profile")),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
