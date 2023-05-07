import 'dart:convert';

import 'package:app/models/classify_result.dart';
import 'package:app/models/history_item.dart';
import 'package:app/models/pest_detection_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static SharedPreferences? prefs;

  LocalStorageServices();

  static const _identifyHistoryKey = 'identify_history_list';

  // static Future<LocalStorageServices> create() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   return LocalStorageServices(prefs: prefs);
  // }

  Future<List<String>> getIdentifyHistoryList() async {
    try {
      prefs ??= await SharedPreferences.getInstance();
      var identifyHistoryList = prefs!.getStringList(_identifyHistoryKey) ?? [];
      return identifyHistoryList;
    } catch (e) {
      rethrow;
    }
  }

  void saveClassifyHistory(ClassifyResult classifyResult) async {
    try {
      prefs ??= await SharedPreferences.getInstance();
      var historyItemJson =
          (classifyResult as ClassifySuccessResult).toHistoryItemJson();
      var identifyHistoryList = await getIdentifyHistoryList();
      identifyHistoryList.add(jsonEncode(historyItemJson));
      await prefs!.setStringList(_identifyHistoryKey, identifyHistoryList);
      await prefs!.setString(
          historyItemJson["key"], jsonEncode(classifyResult.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  void saveDetectionHistory(PestDetectionResult detectionResult) async {
    try {
      prefs ??= await SharedPreferences.getInstance();
      var historyItemJson =
          (detectionResult as PestDetectingSuccess).toHistoryItemJson();
      var identifyHistoryList = await getIdentifyHistoryList();
      identifyHistoryList.add(jsonEncode(historyItemJson));
      await prefs!.setStringList(_identifyHistoryKey, identifyHistoryList);
      await prefs!.setString(
          historyItemJson["key"], jsonEncode(detectionResult.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getIdentifyHistoryDetail(String key) async {
    try {
      prefs ??= await SharedPreferences.getInstance();
      final identifyHistory = prefs!.getString(key);
      return identifyHistory;
    } catch (e) {
      rethrow;
    }
  }

  void _clearHistoryDetailWithKey(String key) async {
    try {
      prefs ??= await SharedPreferences.getInstance();
      prefs!.remove(key);
    } catch (e) {
      rethrow;
    }
  }

  void clearAllHistory() async {
    try {
      prefs ??= await SharedPreferences.getInstance();
      var historyList = await getIdentifyHistoryList();
      var historyKeyList = historyList.map((e) => jsonDecode(e)["key"]);
      for (var key in historyKeyList) {
        _clearHistoryDetailWithKey(key);
      }
      prefs!.remove(_identifyHistoryKey);
    } catch (e) {
      rethrow;
    }
  }
}
