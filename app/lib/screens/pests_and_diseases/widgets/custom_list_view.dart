import 'package:app/models/item.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.list});

  final List<Item> list;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: [
                for (var item in list) ...[
                  ItemWidget(item: item, type: 1),
                  const SizedBox(height: 5)
                ]
              ],
            )));
  }
}
