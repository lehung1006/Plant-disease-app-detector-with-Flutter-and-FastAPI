import 'dart:convert';
import 'package:app/screens/identification/widgets/loading_widget.dart';
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
          return Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.memory(base64Decode(state.pestDetection.img!),
                    fit: BoxFit.cover))
          ]);
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
