import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      required this.iconData,
      required this.iconColor,
      required this.label,
      required this.path});

  final IconData iconData;
  final Color iconColor;
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(path);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        leading: FaIcon(iconData, color: iconColor),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w400)),
        trailing: const FaIcon(FontAwesomeIcons.chevronRight,
            size: 14, color: Color(0xff95a5a6)),
      ),
    );
  }
}
