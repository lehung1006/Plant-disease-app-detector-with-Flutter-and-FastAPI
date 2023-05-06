import 'package:app/models/classify_result.dart';

import '../models/plant_detail.dart';
import '../models/item.dart';
import '../network/api_services.dart';
import '../network/dio_exception.dart';
import 'package:dio/dio.dart';

abstract class PlantsRepo {
  Future<List<Item>> getPlantList();
  Future<PlantDetail> getPlantDetail(String plantId);
  Future<ClassifyResult> getPlantClassifyResult(String imgBase64);
}

class PlantsRepoImpl extends PlantsRepo {
  final ApiServices _apiServices;

  PlantsRepoImpl(this._apiServices);

  @override
  Future<List<Item>> getPlantList() async {
    try {
      final response = await _apiServices.getPlantList();
      var data = response.data["data"];
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
  Future<PlantDetail> getPlantDetail(String plantId) async {
    try {
      final response = await _apiServices.getPlantDetail(plantId);
      var data = response.data["data"];
      return PlantDetail.fromJson(data);
    } on DioError catch (e) {
      throw DioExceptions.toException(e);
    }
  }

  @override
  Future<ClassifyResult> getPlantClassifyResult(String imgBase64) async {
    try {
      final response = await _apiServices.getPlantsClassifyResult(imgBase64);
      var data = response.data["data"];
      if(data == null) {
        return NoPlantInImageResult(imgBase64);
      } else if (data == "") {
        return HealthyPlantResult(imgBase64);
      } else if (data == {}) {
        return ClassifyFailedResult(imgBase64);
      }
      return ClassifySuccessResult.fromJson(data, 2, imgBase64);
    } catch (e) {
      rethrow;
    }
  }
}
