import 'dart:convert';

import 'package:app/local_storage/local_storage_services.dart';
import 'package:app/models/classify_result.dart';
import 'package:app/models/history_item.dart';
import 'package:app/models/item.dart';
import 'package:app/models/pest_detection_result.dart';

abstract class IdentifyHistoryRepo {
  Future<List<HistoryItem>> getHistoryList();
  void saveClassifyHistory(ClassifyResult classifyResult);
  void saveDetectionHistory(PestDetectionResult detectionResult);
  dynamic getIdentifyHistoryDetail(String key, int type);
  void clearAllHistory();
}

class IdentifyHistoryRepoImpl extends IdentifyHistoryRepo {
  final LocalStorageServices _localStorageServices;

  IdentifyHistoryRepoImpl(this._localStorageServices);

  @override
  Future<List<HistoryItem>> getHistoryList() async {
    var localResponse = await _localStorageServices.getIdentifyHistoryList();
    List<HistoryItem> result = [];
    for (var str in localResponse) {
      result.add(HistoryItem.fromJson(jsonDecode(str)));
    }
    return result;
  }

  @override
  void saveClassifyHistory(ClassifyResult classifyResult) async =>
      _localStorageServices.saveClassifyHistory(classifyResult);

  @override
  void saveDetectionHistory(PestDetectionResult detectionResult) async =>
      _localStorageServices.saveDetectionHistory(detectionResult);

  @override
  dynamic getIdentifyHistoryDetail(String key, int type) async {
    var historyDetail =
        await _localStorageServices.getIdentifyHistoryDetail(key);
    var historyDetailJson = jsonDecode(historyDetail!);
    if (type == 1) {
      var pestsJson = historyDetailJson["pests"];
      List<List<Item>> pestsItem = [];
      for (var list in pestsJson) {
        List<Item> temp = [];
        for (var json in list) {
          temp.add(Item.fromJson(json));
        }
        pestsItem.add(temp);
      }
      return PestDetectingSuccess.fromMap(
          {"pests": pestsItem, "img": historyDetailJson["img"]});
    }
    return ClassifySuccessResult.fromJson(historyDetailJson, 2, null);
  }

  @override
  void clearAllHistory() => _localStorageServices.clearAllHistory();
}
