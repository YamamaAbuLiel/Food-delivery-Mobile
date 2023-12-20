import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final String labelText;
  final FormFieldValidator<String>? validator; // Add validator here

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.prefixIcon,
    required this.labelText,
    this.validator, // Validator parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPassword = prefixIcon == Icons.password;

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 13.0),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              labelText: labelText,
              prefixIcon: Icon(prefixIcon),
              contentPadding:
              EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              filled: true,
              fillColor: Color.fromRGBO(232, 232, 232, 100),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            // Add validator to the TextFormField widget
            validator: validator,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
