import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    if (text == "Log Out") {
      buttonColor = Colors.red;
    } else if (text == "Edit") {
      buttonColor = Colors.yellow;
    } else if (text == "Save") {
      buttonColor = Colors.green;
    } else {
      // Default color if none of the conditions match
      buttonColor = Colors.white60;
    }

    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
