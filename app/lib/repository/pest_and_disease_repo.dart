import 'package:app/models/classify_result.dart';
import 'package:app/models/item.dart';
import 'package:app/models/pest_and_disease_detail.dart';
import 'package:app/models/pest_detection_result.dart';
import 'package:app/network/api_services.dart';
import 'package:app/network/dio_exception.dart';
import 'package:dio/dio.dart';

abstract class PestAndDiseaseRepo {
  Future<List<Item>> getPestList();
  Future<List<Item>> getDiseaseList();
  Future<PestAndDiseaseDetail> getDiseaseDetail(String id);
  Future<PestAndDiseaseDetail> getPestDetail(String id);
  Future<ClassifyResult> getDiseasesClassifyResult(String imgBase64);
  Future<PestDetectionResult> getPestDetectionResult(String imgBase64);
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
  Future<PestAndDiseaseDetail> getDiseaseDetail(String id) async {
    try {
      final response = await _apiServices.getDiseaseDetail(id);
      var data = response.data["data"];
      return PestAndDiseaseDetail.fromJson(data);
    } on DioError catch (e) {
      throw Exception(DioExceptions.fromDioError(e).toString());
    }
  }

  @override
  Future<PestAndDiseaseDetail> getPestDetail(String id) async {
    try {
      final response = await _apiServices.getPestDetail(id);
      var data = response.data["data"];
      return PestAndDiseaseDetail.fromJson(data);
    } on DioError catch (e) {
      throw Exception(DioExceptions.fromDioError(e).toString());
    }
  }

  @override
  Future<ClassifyResult> getDiseasesClassifyResult(String imgBase64) async {
    try {
      final response = await _apiServices.getDiseasesClassifyResult(imgBase64);
      var data = response.data["data"];
      if (data == null) {
        return NoPlantInImageResult(imgBase64);
      } else if (data == {}) {
        return ClassifyFailedResult(imgBase64);
      } else if (data == "") {
        return HealthyPlantResult(imgBase64);
      }
      return ClassifySuccessResult.fromJson(data, 0, imgBase64);
    } on DioError catch (e) {
      throw DioExceptions.toException(e);
    }
  }

  @override
  Future<PestDetectionResult> getPestDetectionResult(String imgBase64) async {
    try {
      final response = await _apiServices.getPestDetectionResult(imgBase64);

      var data = response.data["data"];
      if (data.isEmpty) {
        return PestDetectingFailed(imgBase64);
      }
      final Map<String, dynamic> dataParsed =
          PestDetectingSuccess.pestDetectionJsonParser(data);
      return PestDetectingSuccess.fromMap(dataParsed);
    } on DioError catch (e) {
      throw DioExceptions.toException(e);
    }
  }
}
