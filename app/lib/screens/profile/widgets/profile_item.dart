import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ProfileItem extends StatelessWidget {
  ProfileItem({
    super.key,
    this.iconData,
    this.image,
    this.color,
    this.path,
    required this.label,
  });

  IconData? iconData;
  Color? color;
  Image? image;
  String? path;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (path != null) {
          context.push(path!);
        }
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        leading: image ??
            FaIcon(
              iconData,
              color: color,
              size: 20,
            ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w400)),
        trailing: const FaIcon(FontAwesomeIcons.chevronRight,
            size: 14, color: Color(0xff95a5a6)),
      ),
    );
  }
}
