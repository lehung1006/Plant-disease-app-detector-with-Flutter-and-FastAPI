import 'package:app/router/routes.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCapture extends StatefulWidget {
  const ImageCapture({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  late final CameraController _cameraController;
  XFile? pictureFile;
  late final String appBarTitle;

  @override
  void initState() {
    // TODO: implement initState
    appBarTitle = context.read<FloatingActionButtonBloc>().getTitle();
    _cameraController =
        CameraController(widget.cameras.first, ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  void goToImageReview(Uint8List imgBytes) =>
      context.push(RoutesPath.imageReviewRoute, extra: imgBytes);

  @override
  void dispose() {
    // TODO: implement dispose
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(appBarTitle, style: const TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          backgroundColor: const Color.fromRGBO(219, 215, 215, 0.0),
          elevation: 0,
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: !_cameraController.value.isInitialized
                  ? const Center(child: CircularProgressIndicator())
                  : CameraPreview(_cameraController),
            ),
            Positioned(
              bottom: 30,
              child: ElevatedButton(
                onPressed: () async {
                  pictureFile = await _cameraController.takePicture();
                  Uint8List imgBytes = await pictureFile!.readAsBytes();

                  goToImageReview(imgBytes);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  side: const BorderSide(width: 4, color: Colors.white),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                child: const SizedBox(width: 75, height: 75),
              ),
            )
          ],
        ));
  }
}
