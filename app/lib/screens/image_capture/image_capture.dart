import 'package:app/widgets/app_bloc/app_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ImageCapture extends StatefulWidget {
  const ImageCapture({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Nhận diện bệnh'),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft,
              color: Color(0xff7f8c8d)),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromRGBO(219, 215, 215, 0.0),
        elevation: 0,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_cameraController);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
