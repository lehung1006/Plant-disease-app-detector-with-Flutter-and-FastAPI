import 'package:app/router/routes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageCapture extends StatefulWidget {
  const ImageCapture({super.key, required this.cameras, required this.type});

  final List<CameraDescription> cameras;
  final int type;

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
    switch (widget.type) {
      case 0:
        {
          appBarTitle = 'Nhận diện bệnh';
          break;
        }
      case 1:
        {
          appBarTitle = 'Nhận diện sâu bọ';
          break;
        }
      case 2:
        {
          appBarTitle = 'Nhận diện cây';
          break;
        }
    }
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

  void goToImageReview(XFile pictureFile) =>
      context.push(RoutesPath.imageReviewRoute, extra: pictureFile.path);

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
          title: Text(appBarTitle),
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
                  var dio = Dio();
                  var res = await dio.post(
                    'http://10.0.2.2:8000/plants/classify',
                    data: {
                      "img": base64Encode(await pictureFile!.readAsBytes()),
                    },
                  );
                  // goToImageReview(pictureFile!);
                  print(res.data);
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
