import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.context});

  final BuildContext context;

  static const imageAssets = [
    'lib/images/khuyenmai.jpg',
    'lib/images/khuyenmai1.jpg',
    'lib/images/khuyenmai2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 150.0,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3)),
      items: imageAssets.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              i,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            );
          },
        );
      }).toList(),
    );
  }
}
