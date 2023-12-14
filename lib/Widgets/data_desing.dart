import 'package:flutter/material.dart';

class DataDesign extends StatelessWidget {
  final String _titel;
  final String _value;
  const DataDesign(this._titel, this._value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0 ,left:25.0 ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _titel,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _value,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
