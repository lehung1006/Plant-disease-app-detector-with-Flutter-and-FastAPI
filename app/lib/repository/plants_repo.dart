import '../models/plant_detail.dart';
import '../models/item.dart';
import '../network/api_services.dart';
import '../network/dio_exception.dart';
import 'package:dio/dio.dart';

abstract class PlantsRepo {
  Future<List<Item>> getPlantList();
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
      for(var json in data) {
        result.add(Item.fromJson(json));
      }
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }
}
