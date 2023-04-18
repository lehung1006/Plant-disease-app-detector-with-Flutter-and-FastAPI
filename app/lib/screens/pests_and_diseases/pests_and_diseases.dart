import 'package:app/screens/pests_and_diseases/bloc/pests_and_diseases_bloc.dart';
import 'package:app/screens/pests_and_diseases/widgets/custom_list_view.dart';
import 'package:app/screens/pests_and_diseases/widgets/mini_app_bar.dart';
import 'package:app/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    var pestsAndDiseasesBloc = context.read<PestsAndDiseasesBloc>();
    if (pestsAndDiseasesBloc.state is GetPestsOrDiseasesFailure) {
      pestsAndDiseasesBloc.add(GetPestsAndDiseasesEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PestsAndDiseasesBloc, PestsAndDiseasesState>(
      listener: (context, state) {
        if (state is GetPestsOrDiseasesFailure) {
          showToast(state.e);
        }
      },
      child: Scaffold(
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
        body: TabBarView(controller: _tabController, children: [
          CustomScrollView(
            slivers: [
              const MiniAppBar(title: 'Bệnh'),
              BlocBuilder<PestsAndDiseasesBloc, PestsAndDiseasesState>(
                builder: (context, state) {
                  if (state is GetPestsAndDiseasesSuccess) {
                    return CustomListView(list: state.diseases);
                  }
                  return const SliverFillRemaining(
                    child: Center(
                      child:
                          CircularProgressIndicator(color: Color(0xFF2ECC71)),
                    ),
                  );
                },
              ),
            ],
          ),
          CustomScrollView(
            slivers: [
              const MiniAppBar(title: 'Sâu bệnh'),
              BlocBuilder<PestsAndDiseasesBloc, PestsAndDiseasesState>(
                builder: (context, state) {
                  if (state is GetPestsAndDiseasesSuccess) {
                    return CustomListView(list: state.pests);
                  }
                  return const SliverFillRemaining(
                    child: Center(
                      child:
                          CircularProgressIndicator(color: Color(0xff2ecc71)),
                    ),
                  );
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
