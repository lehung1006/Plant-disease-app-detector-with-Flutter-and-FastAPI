import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.subTitle});

  final IconData leading;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: -3,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        visualDensity: const VisualDensity(vertical: -4),
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FaIcon(leading, color: const Color(0xff00b894), size: 20)
        ]),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Text(subTitle, style: const TextStyle(color: Color(0xff7f8c8d)))
          ],
        ));
  }
}
