import 'package:flutter/material.dart';
import 'package:untitled/Widgets/custom_tab_bar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(231, 108, 56, 100),
        title: Text('Main Page'),
        centerTitle: true,
      ),

     // bottomNavigationBar: CustomTabBar(),

    );
  }
}
