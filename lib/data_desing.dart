import 'package:flutter/material.dart';

class DataDesign extends StatelessWidget {
  final String _titel;
  final String _value;
  static const IconData _fixedIcon = Icons.edit;
  const DataDesign(this._titel, this._value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
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
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _value,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          IconButton(
            padding: const EdgeInsets.only(top: 45.0),
            icon: const Icon(_fixedIcon),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
