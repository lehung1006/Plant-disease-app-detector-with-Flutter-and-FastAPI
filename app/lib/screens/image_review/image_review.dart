import 'package:flutter/material.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ImageReview extends StatelessWidget {
  const ImageReview({super.key, required this.pictureFilePath});

  final String pictureFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.file(
              File(pictureFilePath),
              fit: BoxFit.fill,
            )),
        Positioned(
          bottom: 20,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white),
                child: const Icon(FontAwesomeIcons.xmark,
                    size: 30, color: Colors.red),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white),
                child: const Icon(FontAwesomeIcons.check,
                    size: 30, color: Color(0xff3498db)),
              )
            ],
          ),
        )
      ],
    ));
  }
}
