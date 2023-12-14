import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final String labelText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.prefixIcon,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0 , right: 25.0, top: 13.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              prefixIcon: Icon(prefixIcon),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              filled: true,
              fillColor: Color.fromRGBO(232, 232, 232, 100), // Add a background color if needed
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none, // Remove the border
              ),
            ),
          ),
          SizedBox(height: 15), // Use SizedBox for spacing
        ],
      ),
    );
  }
}
