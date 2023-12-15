import 'package:flutter/material.dart';
import 'package:untitled/Pages/main_page.dart';
import 'package:untitled/Pages/profile_screen.dart';
import 'package:untitled/Pages/search.dart';
import 'package:untitled/Pages/order_screen.dart';
import 'package:untitled/Pages/cart.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MainPage(),
    Search(),
    Cart(),
    Order(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixed Bottom Navigation Bar'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(231, 108, 56, 1.0),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color.fromRGBO(231, 108, 56, 1.0),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Order',
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
