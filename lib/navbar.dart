import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/homepage.dart';
import 'package:marketplace/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _index = 1;
  final screens = [
    CartPage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      backgroundColor: Colors.orange.shade200,
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        backgroundColor: Colors.orange.shade200,
        color: Colors.orange,
        animationDuration: Duration(milliseconds: 200),
        items: [
          Icon(Icons.shopping_cart, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}
