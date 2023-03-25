import 'package:app/models/item.dart';
import 'package:app/screens/pests_and_diseases/bloc/pests_and_diseases_bloc.dart';
import 'package:app/screens/pests_and_diseases/widgets/tab_item.dart';
import 'package:app/widgets/my_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/widgets/item_widget.dart';

class PestsAndDiseases extends StatefulWidget {
  const PestsAndDiseases({super.key});

  @override
  State<PestsAndDiseases> createState() => _PestsAndDiseasesState();
}

class _PestsAndDiseasesState extends State<PestsAndDiseases>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xff2ecc71),
            unselectedLabelColor: const Color(0xff7f8c8d),
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: const Color(0xff2ecc71),
            tabs: const [
              Tab(
                height: 56,
                icon: FaIcon(FontAwesomeIcons.plantWilt),
              ),
              Tab(icon: FaIcon(FontAwesomeIcons.bugs)),
            ],
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        TabItem(title: 'Bệnh', index: 0),
        TabItem(title: 'Sâu bệnh', index: 1)
      ]),
    );
  }
}
