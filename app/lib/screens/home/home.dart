import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/search_bar.dart';
import './widgets/forum_post.dart';
import '../../widgets/my_search_delegate.dart';

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
          backgroundColor: Colors.white,
          elevation: 3.0,
          shadowColor: Colors.black,
          title:
              const Text('AppName', style: TextStyle(color: Color(0xff2ecc71))),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                iconSize: 20,
                color: const Color(0xff7f8c8d),
                icon: const Icon(FontAwesomeIcons.magnifyingGlass))
          ],
        ),
        body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return const ForumPost();
          },
        ));
  }
}
