import 'package:app/models/classify_result.dart';
import 'package:app/screens/identification/bloc/identification_bloc.dart';
import 'package:app/screens/identification/classify/classify_widgets.dart';
import 'package:app/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Classify extends StatefulWidget {
  const Classify({super.key, required this.result, required this.type});

  final ClassifyResult result;
  final int type;

  @override
  State<Classify> createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  late final Widget classifyWidget;

  @override
  void initState() {
    super.initState();

    if (widget.result is ClassifySuccessResult) {
      classifyWidget =
          ClassifySuccessWidget(result: widget.result as ClassifySuccessResult);
    } else if (widget.result is NoPlantInImageResult) {
      classifyWidget =
          NoPlantInImageWidget(result: widget.result as NoPlantInImageResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IdentificationBloc, IdentificationState>(
        listener: (context, state) {
          if (state is GetClassifyResultFailure) {
            showToast(state.e);
          }
        },
        child: classifyWidget);
  }
}
