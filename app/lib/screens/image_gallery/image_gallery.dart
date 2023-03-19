import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'widgets/grid_gallery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  static final scrollCtr = ScrollController();

  @override
  Widget build(BuildContext context) {
    String title = context.read<FloatingActionButtonBloc>().getTitle();

    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.clear, color: Colors.black)),
            backgroundColor: Colors.white,
            title: Text(title, style: const TextStyle(color: Colors.black))),
        body: GridGallery(
          scrollCtr: scrollCtr,
        ));
  }
}
