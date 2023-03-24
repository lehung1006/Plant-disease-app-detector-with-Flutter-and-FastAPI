import 'package:app/models/item.dart';

class PestDetection {
  Map<String, List<Item>>? pests;
  String? img;

  PestDetection({this.pests, this.img});

  static Map<String, dynamic> pestDetectionJsonParser(data) {
    List detectionList = data["pests"];
    String image = data["image"];
    final Map<String, dynamic> pests = {};
    for (var i = 1; i <= detectionList.length; i++) {
      pests[i.toString()] = detectionList[i].map((e) => Item.fromJson(e));
    }
    return {"pests": pests, "img": image};
  }

  factory PestDetection.fromMap(Map<String, dynamic> map) {
    return PestDetection(pests: map["pests"], img: map["img"]);
  }
}
