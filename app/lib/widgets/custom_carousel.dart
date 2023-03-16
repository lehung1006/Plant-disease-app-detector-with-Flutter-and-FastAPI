import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomeCarousel extends StatefulWidget {
  const CustomeCarousel({super.key, required this.imgs});

  final List<String> imgs;

  @override
  State<CustomeCarousel> createState() => _CustomeCarouselState();
}

class _CustomeCarouselState extends State<CustomeCarousel> {
  int _currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 300.0,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIdx = index;
                });
              }),
          items: widget.imgs.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Image.memory(
                  base64Decode(img),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imgs.map((item) {
                return Container(
                  width: 10,
                  height: 10,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.imgs.indexOf(item) == _currentIdx
                        ? Colors.white.withOpacity(0.8)
                        : Colors.black.withOpacity(0.3),
                  ),
                );
              }).toList()),
        )
      ],
    );
  }
}
