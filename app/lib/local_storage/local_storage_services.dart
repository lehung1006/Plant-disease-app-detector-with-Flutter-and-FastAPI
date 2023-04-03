import 'dart:convert';

import 'package:app/models/history_item.dart';
import 'package:app/models/item.dart';
import 'package:app/models/pest_detection_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  late final SharedPreferences prefs;

  LocalStorageServices() {
    _initPrefs();
  }

  static const _identificationKey = 'identification_history';

  void _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  List<String> getHistoryList() {
    try {
      var identificationHistory = prefs.getStringList(_identificationKey) ?? [];
      return identificationHistory;
    } catch (e) {
      rethrow;
    }
  }

  void addClassifyHistory(Item classifyResult) async {
    try {
      HistoryItem historyItem = HistoryItem.fromJson(classifyResult.toJson());
      var identificationHistory = getHistoryList();
      identificationHistory.add(jsonEncode(historyItem.toJson()));
      await prefs.setStringList(_identificationKey, identificationHistory);
      await prefs.setString(
          historyItem.key!, jsonEncode(classifyResult.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  void addDetectionHistory(PestDetectionResult detectionResult) async {
    try {
      HistoryItem historyItem = HistoryItem.fromJson(detectionResult.toJson());
      var identificationHistory = getHistoryList();
      identificationHistory.add(jsonEncode(historyItem.toJson()));
      await prefs.setStringList(_identificationKey, identificationHistory);
      await prefs.setString(
          historyItem.key!, jsonEncode(detectionResult.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  String? getHistoryDetail(String key) {
    try {
      final identificationHistory = prefs.getString(key);
      return identificationHistory;
    } catch (e) {
      rethrow;
    }
  }
}
