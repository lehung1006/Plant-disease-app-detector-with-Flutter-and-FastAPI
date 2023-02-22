import 'dart:io';

import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'api_paths.dart';
import '../models/product_detail.dart';

class ApiServices {
  final DioClient dioClient;

  ApiServices({required this.dioClient});

  // Future<ProductDetail> getProductDetail() async {
  //   try {
  //     final responseJson = await Dio().get(_baseHost + ApiPaths.getListProduct);
  //     return ProductDetail.fromJson(responseJson);
  //     // return ProductDetail.fromJson(responseJson);
  //   } on SocketException {
  //     rethrow;
  //   }
  // }

  Future<Response> getProductDetail() async {
    try {
      final Response response = await dioClient.get(ApiPaths.getListProduct);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
