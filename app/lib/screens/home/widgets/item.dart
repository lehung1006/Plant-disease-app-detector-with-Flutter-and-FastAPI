import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routes.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(RoutesPath.detailRoute);
      },
      child: Container(
          width: 140,
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 248, 248),
              border: Border.all(width: 1.0, color: const Color(0xffecf0f1))),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'lib/images/burger.jpeg',
                  fit: BoxFit.contain,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                    height: 35,
                    child: const Text("burger ngon nhất trên cuộc đời",
                        style: TextStyle(fontSize: 13))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '50.000đ',
                        style: TextStyle(
                            color: Color(0xfff05222),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(children: const [
                        Text('5'),
                        FaIcon(FontAwesomeIcons.solidStar,
                            color: Color.fromARGB(255, 255, 219, 77), size: 14),
                      ])
                    ],
                  ),
                )
              ])),
    );
  }
}
