import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/cart.dart';
import 'package:e_commerce_app/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  List<Widget> pages = [
    const Home(),
    Cart(
      products: [
        Product(
            title: "Headphone", image: "images/headphone2.png", price: '80'),
      ],
    ),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: const Color(0xfff2f2f2),
          color: Colors.black,
          animationDuration: const Duration(milliseconds: 350),
          onTap: (int index) => setState(() {
                currentTabIndex = index;
              }),
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
          ]),
      body: pages.elementAt(currentTabIndex),
    );
  }
}
