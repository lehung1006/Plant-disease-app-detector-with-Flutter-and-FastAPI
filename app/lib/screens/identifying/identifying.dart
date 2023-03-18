import 'package:app/router/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Identifying extends StatefulWidget {
  const Identifying({super.key, required this.imgBytes});

  final Uint8List imgBytes;

  @override
  State<Identifying> createState() => _IdentifyingState();
}

class _IdentifyingState extends State<Identifying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            titleSpacing: 2.0,
            title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    elevation: 0),
                child: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  context.pop();
                  context.pop();
                })),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: Image.memory(
                    widget.imgBytes,
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircularProgressIndicator(color: Color(0xff2ecc71)),
                  // SizedBox(height: 15),
                  // Text(
                  //   'Đang phân tích',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  // )
                  Text('Cam',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () => context.push(RoutesPath.plantDetailRoute),
                    child: const Text(
                      'Xem thông tin chi tiết',
                      style: TextStyle(color: Color(0xff2ecc71)),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
