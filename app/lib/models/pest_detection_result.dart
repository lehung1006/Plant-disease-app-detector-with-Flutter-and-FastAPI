import 'package:app/models/history_item.dart';
import 'package:app/models/item.dart';

abstract class PestDetectionResult {
  String? img;

  PestDetectionResult(this.img);
}

class PestDetectingSuccess extends PestDetectionResult {
  List<List<Item>>? pests;

  PestDetectingSuccess({this.pests, String? img}) : super(img);

  static Map<String, dynamic> pestDetectionJsonParser(data) {
    List detectionList = data["pests"];
    String image = data["image"];
    List<List<Item>> pests = [];
    for (List pestList in detectionList) {
      List<Item> temp = [];
      for (var json in pestList) {
        temp.add(Item.fromJson(json));
      }
      pests.add(temp);
    }

    return {"pests": pests, "img": image};
  }

  factory PestDetectingSuccess.fromMap(Map<String, dynamic> map) {
    return PestDetectingSuccess(pests: map["pests"], img: map["img"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'pests':
          pests!.map((list) => list.map((e) => e.toJson()).toList()).toList(),
      'img': img
    };
  }

  Map<String, dynamic> toHistoryItemJson() {
    var key = HistoryItem.generateKey(img!);

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return {
      "key": key,
      "img": img,
      "title": "Kết quả nhận diện sâu bệnh",
      "sub_title": "Phát hiện được ${pests!.length} đối tượng",
      "type": 1,
      "date":
          '${date.day.toString()}/${date.month.toString()}/${date.year.toString()}'
    };
  }
}

class PestDetectingFailed extends PestDetectionResult {
  PestDetectingFailed(String? img) : super(img);
}
