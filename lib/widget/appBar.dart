import 'package:flutter/material.dart';

class commonAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  const commonAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<commonAppbar> createState() => _commonAppbarState();
}

class _commonAppbarState extends State<commonAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      title: const Text(
        "LOGO",
        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
      ),
      actions: const [
        Icon(Icons.shopping_cart),
        SizedBox(width: 10),
        Icon(Icons.person),
        SizedBox(width: 10),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
