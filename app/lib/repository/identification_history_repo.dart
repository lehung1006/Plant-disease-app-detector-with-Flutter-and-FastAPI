import 'dart:convert';

import 'package:app/local_storage/local_storage_services.dart';
import 'package:app/models/history_item.dart';
import 'package:app/models/item.dart';
import 'package:app/models/pest_detection_result.dart';

abstract class IdentificationHistoryRepo {
  List<HistoryItem> getHistoryList();
  void addClassifyHistory(Item classifyResult);
  void addDetectionHistory(PestDetectionResult detectionResult);
  dynamic getHistoryDetail(String key, int type);
}

class IdentificationHistoryRepoImpl extends IdentificationHistoryRepo {
  final LocalStorageServices _localStorageServices;

  IdentificationHistoryRepoImpl(this._localStorageServices);

  @override
  List<HistoryItem> getHistoryList() {
    var localResponse = _localStorageServices.getHistoryList();
    List<HistoryItem> result = [];
    for (var str in localResponse) {
      result.add(HistoryItem.fromJson(jsonEncode(str)));
    }
    return result;
  }

  @override
  void addClassifyHistory(Item classifyResult) =>
      _localStorageServices.addClassifyHistory(classifyResult);

  @override
  void addDetectionHistory(PestDetectionResult detectionResult) =>
      _localStorageServices.addDetectionHistory(detectionResult);

  @override
  dynamic getHistoryDetail(String key, int type) {
    var historyDetail = _localStorageServices.getHistoryDetail(key);
    if(type == 1) {
      return PestDetectionResult.fromMap(jsonDecode(historyDetail!));
    }
    return Item.fromJson(jsonDecode(historyDetail!));
  }
}
