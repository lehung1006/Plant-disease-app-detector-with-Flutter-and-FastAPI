import 'package:app/models/history_item.dart';
import 'package:app/models/item.dart';

class PestDetectionResult {
  List<List<Item>>? pests;
  String? img;

  PestDetectionResult({this.pests, this.img});

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

  factory PestDetectionResult.fromMap(Map<String, dynamic> map) {
    return PestDetectionResult(pests: map["pests"], img: map["img"]);
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
