import 'dart:convert';

import 'package:app/models/classify_result.dart';
import 'package:app/router/routes.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
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
                        Text(result.scienceName ?? ' ',
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
                    params: {'plantId': (result).objectId!});
              } else {
                context.pushNamed(RoutesPath.pestAndDiseaseDetailRoute);
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

class ClassifyFailed extends StatelessWidget {
  const ClassifyFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NoPlantInImageWidget extends StatelessWidget {
  const NoPlantInImageWidget({super.key, required this.result});

  final NoPlantInImageResult result;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Image.memory(
            base64Decode(result.img!),
            fit: BoxFit.cover,
          )),
      const CustomContainer(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Không có thực vật trong ảnh',
                style: TextStyle(color: Color(0xffe74c3c)),
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
                'Chụp lại',
                style: TextStyle(color: Color(0xff2ecc71), fontSize: 15),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
