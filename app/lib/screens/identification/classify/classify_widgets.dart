import 'dart:convert';

import 'package:app/models/classify_result.dart';
import 'package:app/router/routes.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_container.dart';

class ClassifySuccessWidget extends StatelessWidget {
  const ClassifySuccessWidget({super.key, required this.result});

  final ClassifySuccessResult result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.memory(
              base64Decode(result.img!),
              fit: BoxFit.cover,
            )),
        CustomContainer(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(result.name ?? '',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      Row(children: [
                        const Text('Tên khoa học: ',
                            style: TextStyle(
                                color: Color(0xff7f8c8d), fontSize: 16)),
                        Text(result.scienceName ?? '',
                            style: const TextStyle(fontSize: 16))
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
                leading:
                    Icon(FontAwesomeIcons.leaf, size: 20, color: Colors.black),
                title: Text('Mô tả',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Text(result.description ?? '',
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xff636e72)))
            ],
          ),
        )),
        const SizedBox(height: 10),
        TextButton(
            onPressed: () {
              if (result.type == 2) {
                context.pushNamed(RoutesPath.plantDetailRoute,
                    params: {'plantId': result.objectId!});
              } else {
                context.pushNamed(RoutesPath.pestAndDiseaseDetailRoute,
                    params: {
                      'id': result.objectId!,
                      'type': result.type.toString()
                    });
              }
            },
            child: const Text(
              'Đến xem chi tiết',
              style: TextStyle(color: Color(0xff2ecc71), fontSize: 15),
            ))
      ]),
    );
  }
}

class ClassifyFailedWidget extends StatefulWidget {
  const ClassifyFailedWidget({super.key, required this.result});

  final ClassifyResult result;

  @override
  State<ClassifyFailedWidget> createState() => _ClassifyFailedWidgetState();
}

class _ClassifyFailedWidgetState extends State<ClassifyFailedWidget> {
  late final String notification;

  @override
  void initState() {
    super.initState();
    var type = context.read<FloatingActionButtonBloc>().type;
    switch (widget.result.runtimeType) {
      case NoPlantInImageResult:
        {
          if (type == 0) {
            notification = 'Không phát hiện lá cây trong ảnh';
          } else {
            notification = 'Không có thực vật trong ảnh';
          }
          break;
        }
      case ClassifyFailedResult:
        {
          if (type == 0) {
            notification =
                'Hiện tại ứng dụng vẫn chưa có dữ liệu về loại bệnh này, vui lòng thử lại sau';
          } else {
            notification =
                'Hiện tại ứng dụng vẫn chưa có dữ liệu về loài thực vật, vui lòng thử lại sau';
          }
          break;
        }
      case HealthyPlantResult:
        {
          notification = 'Cây của bạn khỏe mạnh';
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Image.memory(
            base64Decode(widget.result.img!),
            fit: BoxFit.cover,
          )),
      CustomContainer(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                notification,
                style: const TextStyle(color: Color(0xffe74c3c)),
              ))),
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: TextButton(
              onPressed: () {
                context.pop();
                context.read<IdentificationBloc>().add(IdentifyResetEvent());
              },
              child: const Text(
                'Thử lại',
                style: TextStyle(color: Color(0xff2ecc71), fontSize: 15),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
