import 'package:app/models/history_item.dart';

abstract class ClassifyResult {
  String? img;

  ClassifyResult(this.img);
}

class ClassifySuccessResult extends ClassifyResult {
  final int type;
  String? name;
  String? objectId;
  String? scienceName;
  String? description;

  ClassifySuccessResult(
      {required this.type,
      String? img,
      this.name,
      this.objectId,
      this.scienceName,
      this.description})
      : super(img);

  factory ClassifySuccessResult.fromJson(
      Map<String, dynamic> json, int type, String? imgBase64) {
    return ClassifySuccessResult(
        type: type,
        img: imgBase64 ?? json['img'],
        name: json['name'],
        objectId: json['id'],
        scienceName: json['science_name'] ?? '',
        description: json['description'] ?? '');
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

  Map<String, dynamic> toHistoryItemJson() {
    var key = HistoryItem.generateKey(img!);

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return {
      "key": key,
      "img": img,
      "title": name,
      "sub_title": description,
      "type": type,
      "date":
          '${date.day.toString()}/${date.month.toString()}/${date.year.toString()}',
    };
  }
}

class ClassifyFailedResult extends ClassifyResult {
  ClassifyFailedResult(String? img) : super(img);
}

class NoPlantInImageResult extends ClassifyResult {
  NoPlantInImageResult(String? img) : super(img);
}

class HealthyPlantResult extends ClassifyResult {
  HealthyPlantResult(String? img) : super(img);
} // Case for Diseases classify
