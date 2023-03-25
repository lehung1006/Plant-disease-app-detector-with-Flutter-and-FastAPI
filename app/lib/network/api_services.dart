import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'api_paths.dart';

class ApiServices {
  final DioClient dioClient;

  ApiServices({required this.dioClient});

  Future<Response> getPlantList() async {
    try {
      final Response response = await dioClient.get(ApiPaths.getPlantList);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getDiseaseList() async {
    try {
      final Response response = await dioClient.get(ApiPaths.getDiseaseList);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getPestList() async {
    try {
      final Response response = await dioClient.get(ApiPaths.getPestList);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getPlantDetail(String plantId) async {
    try {
      final Response response = await dioClient
          .get(ApiPaths.getPlantDetail, queryParameters: {'id': plantId});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getPlantsClassifyResult(String imgBase64) async {
    try {
      final Response response = await dioClient
          .post(ApiPaths.plantsClassify, data: {'img': imgBase64});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getDiseasesClassifyResult(String imgBase64) async {
    try {
      final Response response = await dioClient
          .post(ApiPaths.diseasesClassify, data: {'img': imgBase64});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getPestDetectionResult(String imgBase64) async {
    try {
      final Response response = await dioClient
          .post(ApiPaths.pestDetectionRoute, data: {"img": imgBase64});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
