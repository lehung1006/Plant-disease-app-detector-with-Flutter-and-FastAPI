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

  Map<String, String> toJson() {
    return {
      'pests': pests != null ? pests.toString() : [].toString(),
      'img': img ?? ''
    };
  }

  Map<String, String> toHistoryItemJson() {
    return {
      'img': img ?? '',
      'title': 'Kết quả nhận diện sâu bọ',
      'sub_title': 'Phát hiện được ${pests!.length.toString()} đối tượng',
      'type': '1'
    };
  }
}
