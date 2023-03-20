import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(color: Color(0xff2ecc71)),
            SizedBox(height: 15),
            Text(
              'Đang phân tích',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ]),
    );
  }
}
