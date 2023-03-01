import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'api_paths.dart';

class ApiServices {
  final DioClient dioClient;

  ApiServices({required this.dioClient});

  Future<Response> getProductDetail() async {
    try {
      final Response response = await dioClient.get(ApiPaths.getListProduct);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
