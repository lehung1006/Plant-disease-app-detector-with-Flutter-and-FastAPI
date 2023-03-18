import 'package:app/router/routes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyModalBottomSheet {
  static void showModal(
          BuildContext context, String type, List<CameraDescription> cameras) =>
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 10, maxHeight: 200),
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 120,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  child: Column(children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              context.pushNamed(RoutesPath.imageCaptureRoute,
                                  params: {'type': type}, extra: cameras);
                            },
                            child: const Center(
                                child: Text('Chụp ảnh từ Camera',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff3498db)))))),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              context.pushNamed(RoutesPath.imageGalleryRoute,
                                  params: {'type': type});
                            },
                            child: const Center(
                                child: Text('Chọn ảnh từ Thư viện',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff3498db)))))),
                  ]),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: 60,
                  child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Center(
                              child: Text('Hủy',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffe74c3c)))))))
            ],
          );
        },
      );
}
