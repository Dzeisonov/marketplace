import 'package:flutter/material.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/homePage.dart';
import 'package:marketplace/profile.dart';
import 'package:marketplace/catalog.dart';

////////////////////>>>>>>>>>>> Not Used <<<<<<<<<<<<////////////////////
class NavCat extends StatefulWidget {
  const NavCat({Key? key}) : super(key: key);

  @override
  State<NavCat> createState() => _NavBarState();
}

class _NavBarState extends State<NavCat> {
  int _index = 1;
  final screens = [
    HomePage(),
    CatalogPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        backgroundColor: Colors.black,
        // color: Colors.black,
        // animationDuration: Duration(milliseconds: 200),
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
