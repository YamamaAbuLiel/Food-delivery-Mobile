
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Widgets/custom_tab_bar_widget.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serch"),

      ),
      //bottomNavigationBar: CustomTabBar(),

    );
  }
}
