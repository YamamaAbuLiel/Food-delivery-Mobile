import 'package:flutter/material.dart';
import 'package:untitled/Widgets/custom_tab_bar_widget.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
     // bottomNavigationBar: CustomTabBar(),

    );
  }
}
