import 'package:app/models/item.dart';
import 'package:app/screens/pests_and_diseases/bloc/pests_and_diseases_bloc.dart';
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

  Item item = Item(
      name: 'Sâu cuốn lá',
      description:
          'Sâu cuốn lá hay sâu ăn lá gây hại chủ yếu trên các loại cây họ dưa, bầu bí, cà chua và một số loại rau xanh, cây ăn quả, lúa,');

  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          elevation: 0,
          floating: true,
          title: Text('Bệnh',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
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
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: BlocBuilder<PestsAndDiseasesBloc, PestsAndDiseasesState>(
              builder: (context, state) {
            if (state is GetDiseasesSuccess) {
              var list = state.diseases;
              return Column(
                children: [
                  for (var item in list) ...[
                    ItemWidget(item: item, type: 1),
                    const SizedBox(height: 5)
                  ]
                ],
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Color(0xff2ecc71),
            ));
          }),
        )),
      ]),
    );
  }
}
