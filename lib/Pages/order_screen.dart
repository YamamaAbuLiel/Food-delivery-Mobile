
import 'package:flutter/material.dart';

import '../Widgets/custom_tab_bar_widget.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      //bottomNavigationBar: CustomTabBar(),

    );
  }
}
