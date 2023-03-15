import 'package:app/models/item.dart';
import 'package:app/network/api_services.dart';
import 'package:app/network/dio_exception.dart';
import 'package:dio/dio.dart';

abstract class PestAndDiseaseRepo {
  // Future<List<Item>> getPestList();
  Future<List<Item>> getDiseaseList();
}

class PestAndDiseaseRepoImpl extends PestAndDiseaseRepo {
  final ApiServices _apiServices;

  PestAndDiseaseRepoImpl(this._apiServices);

  // @override
  // Future<List<Item>> getPestList() {

  // }

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
}