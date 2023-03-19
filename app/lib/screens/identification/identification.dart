import 'dart:convert';

import 'package:app/router/routes.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Identification extends StatefulWidget {
  const Identification({super.key, required this.imgBytes});

  final Uint8List imgBytes;

  @override
  State<Identification> createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  @override
  void initState() {
    // TODO: implement initState
    var imgBase64 = base64Encode(widget.imgBytes);
    var type = context.read<FloatingActionButtonBloc>().type;

    context
        .read<IdentificationBloc>()
        .add(GetIdentificationResultEvent(imgBase64: imgBase64, type: type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IdentificationBloc, IdentificationState>(
      listener: (context, state) {
        if (state is GetIdentificationResultSuccess) {

          print('Success: ${state.item.name}');
        } else if (state is GetIdentificationResultFailure) {
          print('Fail: ${state.e.toString()}');
        }
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
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
          body: Column(
            children: [
              Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Image.memory(
                      widget.imgBytes,
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CircularProgressIndicator(color: Color(0xff2ecc71)),
                    // SizedBox(height: 15),
                    // Text(
                    //   'Đang phân tích',
                    //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    // )
                    Text('Cam',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    TextButton(
                      onPressed: () =>
                          context.push(RoutesPath.plantDetailRoute),
                      child: const Text(
                        'Xem thông tin chi tiết',
                        style: TextStyle(color: Color(0xff2ecc71)),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
