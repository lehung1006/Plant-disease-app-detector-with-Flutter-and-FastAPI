import 'dart:convert';

import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:app/screens/identification/classify/classify.dart';
import 'package:app/screens/identification/detect/detect.dart';
import 'package:app/screens/identification/widgets/loading_widget.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Identification extends StatefulWidget {
  Identification({super.key, required this.imgBytes, this.type});

  final Uint8List imgBytes;
  int? type;

  @override
  State<Identification> createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  late final int type;

  @override
  void initState() {
    // TODO: implement initState
    var identifyBloc = context.read<IdentificationBloc>();
    type = widget.type ??= context.read<FloatingActionButtonBloc>().type;
    if (identifyBloc.state is! GetClassifyResultSuccess &&
        identifyBloc.state is! GetPestDetectionResultSuccess &&
        identifyBloc.state is! GetIdentifyHistoryDetailEvent) {
      var imgBase64 = base64Encode(widget.imgBytes);
      if (widget.type == 1) {
        identifyBloc.add(GetPestDetectionResultEvent(imgBase64: imgBase64));
      } else {
        identifyBloc.add(
            GetClassifyResultEvent(imgBase64: imgBase64, type: widget.type!));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  context.read<IdentificationBloc>()
                    ..add(IdentifyResetEvent())
                    ..add(GetIdentifyHistoryListEvent());
                })),
        body: BlocBuilder<IdentificationBloc, IdentificationState>(
          builder: (context, state) {
            if (state is GetClassifyResultSuccess) {
              return Classify(result: state.result, type: type);
            } else if (state is GetPestDetectionResultSuccess) {
              return Detect(result: state.pestDetectionResult);
            }
            return Column(children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Image.memory(widget.imgBytes, fit: BoxFit.cover)),
              const LoadingWidget()
            ]);
          },
        ));
  }
}
