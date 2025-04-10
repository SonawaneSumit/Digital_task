import 'package:digital_test/utils/responsive.dart';
import 'package:digital_test/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomePage_Web extends StatefulWidget {
  const HomePage_Web({super.key});

  @override
  State<HomePage_Web> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage_Web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce Store"),
        centerTitle: true,
        elevation: 6,
      ),
      drawer: const DrawerWidget(),
      body: Responsive.isDesktop(context)
          ? Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ProductList(),
                ),
                CartSummary(),
              ],
            )
          : Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ProductList(),
                ),
                CartSummary(),
              ],
            ),
    );
  }
}

class SidebarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          SidebarItem(title: 'Categories'),
          SidebarItem(title: 'Profile'),
          SidebarItem(title: 'Cart'),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  const SidebarItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 2,
      ),
      itemCount: 8,
      itemBuilder: (context, index) => ProductCard(index: index),
    );
  }
}

class ProductCard extends StatefulWidget {
  final int index;
  const ProductCard({super.key, required this.index});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<String> productImages = [
    'assets/web1.png',
    'assets/Web2.png',
    'assets/Web3.png',
    'assets/Web4.png',
    'assets/web1.png',
    'assets/Web2.png',
    'assets/Web3.png',
    'assets/Web4.png',
  ];

  List<String> productTitle = [
    'S-Series Comfort Chair ',
    'IPS LCD Gaming Monitor',
    'AK-900 Wired Keyboard',
    'Gamepad',
    'S-Series Comfort Chair ',
    'IPS LCD Gaming Monitor',
    'AK-900 Wired Keyboard',
    'Gamepad',
  ];

  List<String> ProductPrice = [
    '\$ 260',
    '\$ 260',
    '\$ 260',
    '\$ 260',
    '\$ 260',
    '\$ 260',
    '\$ 260',
    '\$ 260',
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Card(
        color: Colors.white,
        // elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: FittedBox(
          child: Container(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 4,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  productImages[widget.index],
                  height: 100,
                  width: 100,
                ),
                const SizedBox(width: 10),
                Text(productTitle[widget.index]),
                Text(
                  "\n ${ProductPrice[widget.index]}",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),

                // Icon(Icons.shopping_bag, size: 40, color: Colors.grey[700]),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      overlayColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Container(
          height: 250,
          width: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cart Summary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(),
              const Text(
                'Product Name - \$ 30',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              const Text(
                'Product Name - \$ 50',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              const Text('Sub Total: \$ 80',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
