import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ProfileItem extends StatelessWidget {
  ProfileItem(
      {super.key,
      this.iconData,
      this.image,
      this.color,
      required this.label,
      required this.path});

  IconData? iconData;
  Color? color;
  Image? image;
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(path);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        leading: image ?? FaIcon(iconData, color: color),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w400)),
        trailing: const FaIcon(FontAwesomeIcons.chevronRight,
            size: 14, color: Color(0xff95a5a6)),
      ),
    );
  }
}
