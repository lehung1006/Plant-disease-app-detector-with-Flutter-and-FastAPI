import 'package:app/screens/pest_and_disease_detail/bloc/pest_disease_detail_bloc.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_carousel.dart';

class PestAndDiseaseDetail extends StatelessWidget {
  const PestAndDiseaseDetail({super.key, required this.id, required this.type});

  final String id;
  final int type;

  static const TextStyle _labelStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

  static const _textStyle = TextStyle(fontSize: 16, color: Color(0xff2d3436));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var event = type == 0
            ? GetDiseaseDetailEvent(id: id)
            : GetPestDetailEvent(id: id);
        return PestDiseaseDetailBloc()..add(event);
      },
      child: BlocListener<PestDiseaseDetailBloc, PestDiseaseDetailState>(
        listener: (context, state) {
          if (state is GetDetailDataFaild) {
            showToast(state.e);
          }
        },
        child: Scaffold(
          body: BlocBuilder<PestDiseaseDetailBloc, PestDiseaseDetailState>(
            builder: (context, state) {
              if (state is GetPestDetailSuccess ||
                  state is GetDiseaseDetailSuccess) {
                var result = state is GetPestDetailSuccess
                    ? state.result
                    : (state as GetDiseaseDetailSuccess).result;
                return CustomScrollView(slivers: [
                  CustomAppBar(
                      title: result.name ?? '',
                      imgs: result.imgs ?? [],
                      context: context),
                  SliverToBoxAdapter(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          result.description ?? '',
                          style: _textStyle,
                        ),
                      ),
                      CustomContainer(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cách giải quyết', style: _labelStyle),
                          const SizedBox(height: 15),
                          Text(
                            result.solution ?? '',
                            style: _textStyle,
                          ),
                          const SizedBox(height: 15),
                          // for (var e in solutions.entries) ...[
                          //   RichText(
                          //       text: TextSpan(style: _textStyle, children: [
                          //     TextSpan(
                          //         text: '${e.key}: ',
                          //         style: const TextStyle(fontWeight: FontWeight.w600)),
                          //     TextSpan(text: e.value)
                          //   ])),
                          //   const SizedBox(height: 15)
                          // ],
                        ],
                      )),
                      const Divider(height: 1, thickness: 1),
                      CustomContainer(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cách phòng ngừa', style: _labelStyle),
                          const SizedBox(height: 15),
                          Text(
                            result.prevention ?? '',
                            style: _textStyle,
                          ),
                          const SizedBox(height: 15),
                          // for (var e in preventions.entries) ...[
                          //   RichText(
                          //       text: TextSpan(style: _textStyle, children: [
                          //     TextSpan(
                          //         text: '${e.key}: ',
                          //         style: const TextStyle(fontWeight: FontWeight.w600)),
                          //     TextSpan(text: e.value)
                          //   ])),
                          //   const SizedBox(height: 15)
                          // ],
                        ],
                      ))
                    ]),
                  )
                ]);
              }
              return const Center(
                  child: CircularProgressIndicator(color: Color(0xff2ecc71)));
            },
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: child);
  }
}
