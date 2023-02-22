import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 245, 245),
            borderRadius: BorderRadius.circular(3)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
                flex: 1,
                child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 18)),
            Expanded(
              flex: 8,
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(height: 1, fontSize: 16),
                  controller: controller,
                  onChanged: (value) {
                    print(controller.text);
                  },
                ),
              ),
            ),
          ],
        ));
    ;
  }
}
