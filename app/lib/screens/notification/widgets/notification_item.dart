import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.label,
      required this.path});

  final IconData icon;
  final Color iconColor;
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffbdc3c7)),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(child: FaIcon(icon, size: 24, color: iconColor))),
          const SizedBox(width: 20),
          Text(label, style: const TextStyle(fontSize: 16)),
          const Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: FaIcon(FontAwesomeIcons.chevronRight,
                    size: 14, color: Color(0xff95a5a6))),
          )
        ],
      ),
    );
  }
}
