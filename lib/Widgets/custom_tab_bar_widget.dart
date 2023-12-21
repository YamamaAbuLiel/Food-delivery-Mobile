import 'package:flutter/material.dart';
import 'package:untitled/Pages/cart.dart';
import 'package:untitled/Pages/order_screen.dart';
import 'package:untitled/Pages/profile_screen.dart';
import 'package:untitled/Pages/search.dart';

import '../Pages/items_dispaly.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MyHomePage(),
    Search(),
    Cart(),
    Order(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_line_spacing),
            label: "Orders",
            backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
