import 'package:app/widgets/my_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniAppBar extends StatelessWidget {
  const MiniAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      elevation: 0,
      floating: true,
      title: Text(title,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500)),
      actions: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            iconSize: 20,
            color: const Color(0xff7f8c8d),
            icon: const Icon(FontAwesomeIcons.magnifyingGlass))
      ],
    );
  }
}
