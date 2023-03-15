import 'package:app/widgets/show_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/screens/plants/bloc/plants_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Plants extends StatefulWidget {
  const Plants({super.key});

  @override
  State<Plants> createState() => _OrderState();
}

class _OrderState extends State<Plants> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String title = 'Táo';
  String subTitle =
      'Cam là quả của nhiều loài cây có múi khác nhau thuộc họ Cửu lý hương (Rutaceae) (xem danh sách các loài thực vật được gọi là cam)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Thực vật',
              style: TextStyle(color: Color(0xff2ecc71)))),
      body: BlocListener<PlantsBloc, PlantsState>(
        listener: (context, state) {
          if (state is GetPlantsFailure) {
            showToast(state.errorMessage);
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
                return ItemWidget(item: list[index], type: 0);
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
