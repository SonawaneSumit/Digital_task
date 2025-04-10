// ignore_for_file: must_be_immutable

import 'package:digital_test/view/Mobile/customNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  List<String> brandImages = [
    "assets/Mobile/All_Brands.png",
    "assets/Mobile/7Up.png",
    "assets/Mobile/airWick.png",
    "assets/Mobile/aashirwad.png",
    "assets/Mobile/suhana.png"
  ];

  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 5),
                  Text("Select Location"),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios, size: 14),
                  SizedBox(width: 5),
                  Text("422008", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Products',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brandImages.length,
                  itemBuilder: (context, index) {
                    return brandCircle(brandImages[index]);
                  },
                ),
              ),
              const SizedBox(height: 15),
              ResponsiveBanner(isDesktop: isDesktop),
              const SizedBox(height: 20),
              sectionTitle("Shop by category"),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: isDesktop ? 6 : 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CategoryCard("Beauty & Hygene", 0),
                  CategoryCard("Baby Care", 1),
                  CategoryCard("Beverages", 2),
                  CategoryCard("Snacks & Branded Foods", 3),
                  CategoryCard("Food Grains & Dry Fruits", 4),
                  CategoryCard("Cleaning & Household", 5),
                ],
              ),
              const SizedBox(height: 20),
              sectionTitle("Featured Product"),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCard(
                      name: "Dettol",
                      description:
                          "Original Liquid Handwash Menthol & Magnolia...",
                      price: "90.00",
                      mrp: "125.00",
                      weight: "250 gm",
                      image: "assets/Mobile/Dettol.png",
                    ),
                    ProductCard(
                      name: "Red Label",
                      description: "Red Label Tea Detox Desi Kahwa Green Tea",
                      price: "90.00",
                      mrp: "125.00",
                      weight: "250 gm",
                      image: "assets/Mobile/Red_label.png",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Text("See all", style: TextStyle(color: Colors.green)),
      ],
    );
  }

  Widget brandCircle(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: CircleAvatar(
          radius: 30,
          backgroundColor: name == "assets/Mobile/All_Brands.png"
              ? Color(0xff438130)
              : Colors.white,
          child: Padding(
            padding: EdgeInsets.all(
                name == "assets/Mobile/All_Brands.png" ? 7.0 : 0.0),
            child: Image.asset(name),
          )),
    );
  }
}

class ResponsiveBanner extends StatelessWidget {
  final bool isDesktop;
  const ResponsiveBanner({required this.isDesktop, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isDesktop ? 300 : 150,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: isDesktop
          ? Image.asset(
              "assets/Mobile/banner.png",
              fit: BoxFit.fitHeight,
            )
          : Image.asset(
              "assets/Mobile/banner.png",
              fit: BoxFit.cover,
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final int index;
  CategoryCard(this.title, this.index, {super.key});

  List<String> brandImages = [
    "assets/Mobile/shop1.png",
    "assets/Mobile/shop2.png",
    "assets/Mobile/shop3.png",
    "assets/Mobile/shop4.png",
    "assets/Mobile/shop5.png",
    "assets/Mobile/shop6.png"
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color(0xff53B175).withOpacity(0.6),
              Color(0xff53B175).withOpacity(0.4),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(brandImages[index],
                height: height * 0.09, width: width * 0.4),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String mrp;
  final String weight;
  final String image;

  const ProductCard({
    required this.name,
    required this.description,
    required this.price,
    required this.mrp,
    required this.weight,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9.0),
      child: Stack(
        children: [
          Container(
            width: 220,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(height: 10),
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(weight,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                      Text(
                        "₹ 199.00",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "MRP: ",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      TextSpan(
                        text: "₹$mrp",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("eB Price ₹$price",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFC700),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.celebration,
                        color: Colors.black,
                      ),
                      Text(
                        "AVAILABLE OFFER",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add To Cart",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff438130),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink.shade800,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: Text("Rs. 40/- OFF*",
                    style: TextStyle(color: Colors.white, fontSize: 10))),
          )
        ],
      ),
    );
  }
}
