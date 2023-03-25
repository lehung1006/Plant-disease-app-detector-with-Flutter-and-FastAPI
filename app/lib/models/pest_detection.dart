import 'package:app/models/item.dart';

class PestDetection {
  List<List<Item>>? pests;
  String? img;

  PestDetection({this.pests, this.img});

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

  factory PestDetection.fromMap(Map<String, dynamic> map) {
    return PestDetection(pests: map["pests"], img: map["img"]);
  }
}
