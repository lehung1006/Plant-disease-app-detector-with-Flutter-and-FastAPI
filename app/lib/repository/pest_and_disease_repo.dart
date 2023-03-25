import 'package:app/models/item.dart';
import 'package:app/models/pest_detection.dart';
import 'package:app/network/api_services.dart';
import 'package:app/network/dio_exception.dart';
import 'package:dio/dio.dart';

abstract class PestAndDiseaseRepo {
  Future<List<Item>> getPestList();
  Future<List<Item>> getDiseaseList();
  Future<Item> getDiseasesClassifyResult(String imgBase64);
  Future<PestDetection> getPestDetectionResult(String imgBase64);
}

class PestAndDiseaseRepoImpl extends PestAndDiseaseRepo {
  final ApiServices _apiServices;

  PestAndDiseaseRepoImpl(this._apiServices);

  @override
  Future<List<Item>> getPestList() async {
    try {
      final response = await _apiServices.getPestList();
      var data = response.data['data'];
      List<Item> result = [];
      for (var json in data) {
        result.add(Item.fromJson(json));
      }
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  @override
  Future<List<Item>> getDiseaseList() async {
    try {
      final response = await _apiServices.getDiseaseList();
      var data = response.data['data'];
      List<Item> result = [];
      for (var json in data) {
        result.add(Item.fromJson(json));
      }
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  @override
  Future<Item> getDiseasesClassifyResult(String imgBase64) async {
    try {
      final response = await _apiServices.getDiseasesClassifyResult(imgBase64);
      var data = response.data["data"];
      return Item.fromJson(data);
    } on DioError catch (e) {
      throw DioExceptions.toException(e);
    }
  }

  @override
  Future<PestDetection> getPestDetectionResult(String imgBase64) async {
    try {
      final response = await _apiServices.getPestDetectionResult(imgBase64);

      var data = response.data["data"];
      final Map<String, dynamic> dataParsed =
          PestDetection.pestDetectionJsonParser(data);
      return PestDetection.fromMap(dataParsed);
    } on DioError catch (e) {
      throw DioExceptions.toException(e);
    }
  }
}
