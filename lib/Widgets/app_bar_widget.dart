import 'package:flutter/material.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String head;
  const Custom_AppBar({
    required this.head,


    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(head, style: TextStyle(fontWeight: FontWeight.bold),),
      backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
