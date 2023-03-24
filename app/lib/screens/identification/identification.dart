import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:app/screens/identification/classify/classify.dart';
import 'package:app/screens/identification/pest_detection/pest_detection.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Identification extends StatelessWidget {
  const Identification({super.key, required this.imgBytes});

  final Uint8List imgBytes;

  @override
  Widget build(BuildContext context) {
    int type = context.read<FloatingActionButtonBloc>().type;

    return BlocProvider(
      create: (context) => IdentificationBloc(),
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
          body: type == 1
              ? PestDetection(imgBytes: imgBytes)
              : Classify(imgBytes: imgBytes)),
    );
  }
}
