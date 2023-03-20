import 'dart:convert';
import 'package:app/router/routes.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:app/widgets/show_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/custom_container.dart';
import './widgets/loading_widget.dart';

class Identification extends StatefulWidget {
  const Identification({super.key, required this.imgBytes});

  final Uint8List imgBytes;

  @override
  State<Identification> createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  late String imgBase64;
  late int type;
  @override
  void initState() {
    // TODO: implement initState
    imgBase64 = base64Encode(widget.imgBytes);
    type = context.read<FloatingActionButtonBloc>().type;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => IdentificationBloc()
        ..add(GetIdentificationResultEvent(imgBase64: imgBase64, type: type)),
      child: BlocListener<IdentificationBloc, IdentificationState>(
        listener: (context, state) {
          if (state is GetIdentificationResultFailure) {
            showToast(state.e);
          }
        },
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                titleSpacing: 2.0,
                title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.black.withOpacity(0.2),
                        elevation: 0),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      context.pop();
                      context.pop();
                    })),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Image.memory(
                        widget.imgBytes,
                        fit: BoxFit.cover,
                      )),
                  BlocBuilder<IdentificationBloc, IdentificationState>(
                      builder: (context, state) {
                    if (state is GetIdentificationResultSuccess) {
                      var result = state.item;
                      return Column(children: [
                        CustomContainer(
                            child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(result.name ?? '',
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 10),
                                      Row(children: [
                                        const Text('Tên khoa học: ',
                                            style: TextStyle(
                                                color: Color(0xff7f8c8d),
                                                fontSize: 16)),
                                        Text(result.scienceName ?? ' ',
                                            style:
                                                const TextStyle(fontSize: 16))
                                      ])
                                    ]))),
                        const SizedBox(height: 10),
                        CustomContainer(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Column(
                            children: [
                              const ListTile(
                                contentPadding: EdgeInsets.all(0),
                                horizontalTitleGap: -3,
                                leading: Icon(FontAwesomeIcons.leaf,
                                    size: 20, color: Colors.black),
                                title: Text('Mô tả',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Text(result.description ?? '',
                                  style: const TextStyle(
                                      fontSize: 16, color: Color(0xff636e72)))
                            ],
                          ),
                        )),
                        const SizedBox(height: 10),
                        TextButton(
                            onPressed: () {
                              if (type == 2) {
                                context.pushNamed(RoutesPath.plantDetailRoute,
                                    params: {'plantId': result.id!});
                              } else {
                                context.pushNamed(
                                    RoutesPath.pestAndDiseaseDetailRoute);
                              }
                            },
                            child: const Text(
                              'Đến xem chi tiết',
                              style: TextStyle(
                                  color: Color(0xff2ecc71), fontSize: 15),
                            ))
                      ]);
                    }
                    return const LoadingWidget();
                  }),
                ],
              ),
            )),
      ),
    );
  }
}
