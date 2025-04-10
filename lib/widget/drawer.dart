import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
            ),
            child: const Row(
              children: [
                Icon(Icons.storefront, color: Colors.white, size: 32),
                SizedBox(width: 10),
                Text(
                  "E-Commerce",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, "Category", context),
          _buildDrawerItem(Icons.shopping_cart, "Cart", context),
          _buildDrawerItem(Icons.person, "Profile", context),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String label, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
