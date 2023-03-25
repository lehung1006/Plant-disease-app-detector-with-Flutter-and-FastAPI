import 'package:app/screens/pests_and_diseases/bloc/pests_and_diseases_bloc.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:app/widgets/my_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        elevation: 0,
        floating: true,
        title: Text(title,
            style: const TextStyle(
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
              child: index == 0
                  ? BlocBuilder<PestsAndDiseasesBloc, PestsAndDiseasesState>(
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
                    })
                  : BlocBuilder<PestsAndDiseasesBloc, PestsAndDiseasesState>(
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
                    }))),
    ]);
  }
}
