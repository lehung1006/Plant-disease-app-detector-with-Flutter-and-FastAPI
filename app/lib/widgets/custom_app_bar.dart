import 'package:app/widgets/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.imgs,
      required this.context});

  final String title;
  final List<dynamic> imgs;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 275,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: LayoutBuilder(builder: (p0, p1) {
        var top = p1.biggest.height;
        return FlexibleSpaceBar(
          titlePadding: const EdgeInsetsDirectional.only(start: 20, bottom: 16),
          title: AnimatedOpacity(
              duration: const Duration(microseconds: 300),
              opacity: top <= 100 ? 1.0 : 0.0,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                InkWell(
                  child: const Icon(Icons.arrow_back),
                  onTap: () => context.pop(),
                ),
                const SizedBox(width: 40),
                Text(title, style: const TextStyle(color: Colors.black)),
              ])),
          background: Stack(children: [
            CustomeCarousel(imgs: imgs),
            Positioned(
              top: 30,
              left: 3,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.black.withOpacity(0.2),
                      elevation: 0),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => context.pop()),
            ),
          ]),
        );
      }),
    );
  }
}
