import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'widgets/grid_gallery.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key, required this.type});

  final int type;

  static final scrollCtr = ScrollController();

  @override
  Widget build(BuildContext context) {
    late String title;
    switch (type) {
      case 0:
        {
          title = 'Bệnh';
          break;
        }
      case 1:
        {
          title = 'Sâu bọ';
          break;
        }
      case 2:
        {
          title = 'Cây';
        }
    }
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.clear, color: Colors.black)),
            backgroundColor: Colors.white,
            title: Text('Nhận diện $title',
                style: const TextStyle(color: Colors.black))),
        body: GridGallery(
          scrollCtr: scrollCtr,
        ));
  }
}

