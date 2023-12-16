import 'package:flutter/material.dart';
import 'package:untitled/Widgets/custom_tab_bar_widget.dart';

import '../Widgets/app_bar_widget.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(head: "Cart"),

      // bottomNavigationBar: CustomTabBar(),

    );
  }
}
