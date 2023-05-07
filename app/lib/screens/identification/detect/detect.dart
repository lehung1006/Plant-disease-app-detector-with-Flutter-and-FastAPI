import 'dart:convert';
import 'package:app/models/item.dart';
import 'package:app/models/pest_detection_result.dart';
import 'package:app/screens/identification/widgets/loading_widget.dart';
import 'package:app/screens/pest_and_disease_detail/pest_and_disease_detail.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:app/widgets/show_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detect extends StatefulWidget {
  const Detect({super.key, required this.result});

  final PestDetectionResult result;

  @override
  State<Detect> createState() => _DetectState();
}

class _DetectState extends State<Detect> {
  late final Widget resultWidget;

  @override
  void initState() {
    super.initState();
    if (widget.result is PestDetectingSuccess) {
      resultWidget =
          DetectingSuccessWidget(result: widget.result as PestDetectingSuccess);
    } else {
      resultWidget =
          DetectingFailedWidget(result: widget.result as PestDetectingFailed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IdentificationBloc, IdentificationState>(
        listener: (context, state) {
          if (state is GetPestDetectionResultFailure) {
            showToast(state.e);
          }
        },
        child: resultWidget);
  }
}

class DetectingSuccessWidget extends StatelessWidget {
  const DetectingSuccessWidget({super.key, required this.result});

  final PestDetectingSuccess result;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: result.pests!.length,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.memory(base64Decode(result.img!), fit: BoxFit.cover)),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: const Text('Các đối tượng trong ảnh có thể là',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ))),
        Material(
          color: Colors.white,
          child: TabBar(
              labelColor: const Color(0xff2ecc71),
              unselectedLabelColor: const Color(0xff7f8c8d),
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              indicatorColor: const Color(0xff2ecc71),
              tabs: [
                for (var i = 1; i <= result.pests!.length; i++) ...[
                  Tab(
                      child: Text(i.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)))
                ]
              ]),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: TabBarView(children: [
              for (var pestList in result.pests!) ...[
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var item in pestList) ...[
                        const SizedBox(height: 5),
                        ItemWidget(item: item, type: 1),
                      ]
                    ],
                  ),
                ),
              ],
            ]),
          ),
        )
      ]),
    );
  }
}

class DetectingFailedWidget extends StatelessWidget {
  const DetectingFailedWidget({super.key, required this.result});

  final PestDetectingFailed result;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Image.memory(base64Decode(result.img!), fit: BoxFit.cover)),
      const CustomContainer(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Không phát hiện thấy đối tượng nào trong ảnh",
                style: TextStyle(color: Color(0xffe74c3c)),
              )))
    ]);
  }
}
