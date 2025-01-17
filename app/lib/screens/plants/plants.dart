import 'dart:convert';

import 'package:app/widgets/my_search_delegate.dart';
import 'package:app/widgets/show_toast.dart';
import 'package:app/screens/plants/bloc/plants_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Plants extends StatefulWidget {
  const Plants({super.key});

  @override
  State<Plants> createState() => _PlantsState();
}

class _PlantsState extends State<Plants> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    var plantBloc = context.read<PlantsBloc>();
    if (plantBloc.state is GetPlantsFailure) {
      plantBloc.add(GetPlantsEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            const Text('Thực vật', style: TextStyle(color: Color(0xff2ecc71))),
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
      body: BlocListener<PlantsBloc, PlantsState>(
        listener: (context, state) {
          if (state is GetPlantsFailure) {
            showToast(state.e);
          }
        },
        child: BlocBuilder<PlantsBloc, PlantsState>(builder: (context, state) {
          if (state is GetPlantsSuccess) {
            final list = state.plants;
            return ListView.separated(
              itemCount: list.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                return ItemWidget(item: list[index], type: 2);
              },
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Color(0xff2ecc71),
          ));
        }),
      ),
    );
  }
}
