import 'dart:convert';

import 'package:app/models/history_item.dart';
import 'package:app/router/routes.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.historyItem});

  final HistoryItem historyItem;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 120,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      child: historyItem.img != null
                          ? Image.memory(
                              base64Decode(historyItem.img!),
                              fit: BoxFit.cover,
                            )
                          : const SizedBox.shrink()),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(historyItem.title ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 19)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          historyItem.subTitle ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 91, 100, 100),
                              fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(historyItem.date ?? '')
                      ],
                    ),
                  )),
            ],
          )),
      Positioned.fill(
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.read<IdentificationBloc>().add(
                      GetIdentifyHistoryDetailEvent(
                          key: historyItem.key!, type: historyItem.type!));
                  context.pushNamed(RoutesPath.identificationRoute,
                      params: {'img': historyItem.img!},
                      extra: historyItem.type);
                },
              )))
    ]);
  }
}
