import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(Exception e) {
  late String msg;

  if (e.toString() == "Exception: No Internet") {
    msg = "Không có kết nối mạng";
  } else {
    msg = "Đã có lỗi xảy ra";
  }

  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16);
}
