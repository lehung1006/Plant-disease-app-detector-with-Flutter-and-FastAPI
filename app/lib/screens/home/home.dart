import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/categories_bar.dart';
import './widgets/item.dart';
import './widgets/search_bar.dart';
import './widgets/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final screenWidth = MediaQuery.of(context).size.width;

  late final SearchBar searchBar;

  TextStyle appBarTextStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w500);

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    searchBar = SearchBar(controller: _controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.white,
          elevation: 3.0,
          shadowColor: Colors.black,
          flexibleSpace: SafeArea(
            top: true,
            bottom: false,
            left: false,
            right: false,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Giao đến:', style: appBarTextStyle),
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                      leading: const FaIcon(FontAwesomeIcons.locationDot,
                          size: 16, color: Color.fromARGB(255, 243, 87, 39)),
                      title: Transform.translate(
                        offset: const Offset(-30, 0),
                        child: Text(
                            'Số 3 Đ. Số 3, An Bình, Thành phố Biên Hòa, Đồng...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: appBarTextStyle),
                      ),
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: 12, color: Color(0xff95a5a6)),
                    ),
                    searchBar,
                  ]),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Carousel(context: context),
            const CategoriesBar(),
            Container(
                width: screenWidth,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Món bán chạy",
                            style: TextStyle(
                                color: Color(0xfff05222),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Row(children: const [
                          Text('Xem tất cả',
                              style: TextStyle(color: Color(0xff7f8c8d))),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              size: 12, color: Color(0xff7f8c8d))
                        ])
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 230,
                      child: Center(
                        child: ListView(
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            Item(),
                            Item(),
                            Item(),
                            Item(),
                          ],
                        ),
                      ))
                ]))
          ],
        ));
  }
}
