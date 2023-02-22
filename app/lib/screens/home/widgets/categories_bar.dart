import 'package:flutter/material.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});

  static const List<Map<String, String>> _categoryItems = [
    {'label': 'Cơm', 'img': 'lib/images/categories/com.png'},
    {'label': 'Mì', 'img': 'lib/images/categories/mi.png'},
    {'label': 'Hamburger', 'img': 'lib/images/categories/hamburger.png'},
    {'label': 'Bò', 'img': 'lib/images/categories/bo.png'},
    {'label': 'Heo', 'img': 'lib/images/categories/heo.png'},
    {'label': 'Gà', 'img': 'lib/images/categories/ga.png'},
    {'label': 'Hải sản', 'img': 'lib/images/categories/hai_san.png'},
    {'label': 'Tráng miệng', 'img': 'lib/images/categories/trang_mieng.png'},
    {'label': 'Trà sữa', 'img': 'lib/images/categories/tra_sua.png'},
    {'label': 'Cà phê', 'img': 'lib/images/categories/ca_phe.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: _categoryItems.length,
            separatorBuilder: (context, index) => const SizedBox(width: 30),
            itemBuilder: (context, index) {
              return CategoriesBarItem(
                  imageAssets: _categoryItems[index]['img'],
                  label: _categoryItems[index]['label']);
            },
          ),
        ));
  }
}

class CategoriesBarItem extends StatelessWidget {
  const CategoriesBarItem(
      {super.key, required this.imageAssets, required this.label});

  final String? imageAssets;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(children: <Widget>[
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAssets ?? ''),
              fit: BoxFit.contain,
            ),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label ?? '',
        )
      ]),
    );
  }
}
