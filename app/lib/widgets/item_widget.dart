import 'package:app/models/item.dart';
import 'package:app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item, required this.type});

  final Item item;
  final int type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (type) {
          case 0:
            {
              context.push(RoutesPath.plantDetailRoute);
              break;
            }
          case 1:
            {
              context.push(RoutesPath.pestAndDiseaseDetailRoute);
              break;
            }
        }
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 120,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      child: Image.asset(
                        'lib/images/orange.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item.description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 91, 100, 100),
                              fontSize: 15),
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
    ;
  }
}
