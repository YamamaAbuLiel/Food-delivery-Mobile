import 'package:flutter/material.dart';
import 'package:untitled/Widgets/app_bar_widget.dart';

import '../Widgets/app_bar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(head: "Main Page"),
    );
  }
}

