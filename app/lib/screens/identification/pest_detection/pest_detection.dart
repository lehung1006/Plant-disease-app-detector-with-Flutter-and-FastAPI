import 'dart:convert';
import 'package:app/models/item.dart';
import 'package:app/screens/identification/widgets/loading_widget.dart';
import 'package:app/widgets/item_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PestDetection extends StatefulWidget {
  const PestDetection({super.key, required this.imgBytes});

  final Uint8List imgBytes;

  @override
  State<PestDetection> createState() => _PestDetectionState();
}

class _PestDetectionState extends State<PestDetection> {
  late String imgBase64;

  @override
  void initState() {
    // TODO: implement initState
    imgBase64 = base64Encode(widget.imgBytes);
    context
        .read<IdentificationBloc>()
        .add(GetPestDetectionResultEvent(imgBase64: imgBase64));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdentificationBloc, IdentificationState>(
      builder: (context, state) {
        if (state is GetPestDetectionResultSuccess) {
          var resultImg = state.pestDetection.img;
          var detectionList = state.pestDetection.pests;
          return DefaultTabController(
            initialIndex: 0,
            length: detectionList!.length,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Image.memory(base64Decode(resultImg!),
                      fit: BoxFit.cover)),
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
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    indicatorColor: const Color(0xff2ecc71),
                    tabs: [
                      for (var i = 1; i <= detectionList.length; i++) ...[
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
                    for (var pestList in detectionList) ...[
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
                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: [
                    //       for (var item in detectionList[0]) ...[
                    //         const SizedBox(height: 5),
                    //         ItemWidget(item: item, type: 1),
                    //       ]
                    //     ],
                    //   ),
                    // ),
                    // Column(
                    //   children: [
                    //     for (var item in detectionList[0]) ...[
                    //       ItemWidget(item: item, type: 1),
                    //       const SizedBox(height: 10)
                    //     ]
                    //   ],
                    // ),
                  ]),
                ),
              )
            ]),
          );
        }
        return Column(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.memory(widget.imgBytes, fit: BoxFit.cover)),
          const LoadingWidget()
        ]);
      },
    );
  }
}
