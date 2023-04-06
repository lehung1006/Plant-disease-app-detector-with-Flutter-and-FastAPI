import 'package:app/models/history_item.dart';

class ClassifyResult {
  final int type;
  String? img;
  String? name;
  String? objectId;
  String? scienceName;
  String? description;

  ClassifyResult(
      {required this.type,
      this.img,
      this.name,
      this.objectId,
      this.scienceName,
      this.description});

  factory ClassifyResult.fromJson(
      Map<String, dynamic> json, int type, String? imgBase64) {
    return ClassifyResult(
        type: type,
        img: imgBase64 ?? json['img'],
        name: json['name'],
        objectId: json['id'],
        scienceName: json['science_name'] ?? '',
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "img": img,
      "name": name,
      "id": objectId,
      "science_name": scienceName,
      "description": description
    };
  }

  Map<String,dynamic> toHistoryItemJson() {
    var key = HistoryItem.generateKey(img!);

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return {
      "key": key,
      "img": img,
      "title": name,
      "sub_title": description,
      "type": type,
      "date": '${date.day.toString()}/${date.month.toString()}/${date.year.toString()}',
    };
  }
}
