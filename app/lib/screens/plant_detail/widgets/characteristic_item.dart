import 'package:flutter/material.dart';

class CharacteristicsItem extends StatelessWidget {
  const CharacteristicsItem(
      {super.key, required this.left, required this.right});

  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(children: [
        Expanded(
          child: Text(
            left,
            style: const TextStyle(color: Color(0xff7f8c8d), fontSize: 16),
          ),
        ),
        Expanded(child: Text(right, style: const TextStyle(fontSize: 16)))
      ]),
    );
  }
}