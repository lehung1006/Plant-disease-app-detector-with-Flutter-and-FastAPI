import 'package:app/models/pest_item.dart';

class PestDetection {
  Map<String, dynamic>? pests;
  String? img;

  PestDetection({this.pests, this.img});

  static Map<String, dynamic> pestDetectionJsonParser(data) {
    List detectionList = data["pests"];
    String image = data["image"];
    final Map<String, dynamic> pests = {};
    for (var i = 0; i < detectionList.length; i++) {
      pests[(i + 1).toString()] =
          detectionList[i].map((e) => PestItem.fromJson(e)).toList();
    }
    return {"pests": pests, "img": image};
  }

  factory PestDetection.fromMap(Map<String, dynamic> map) {
    return PestDetection(pests: map["pests"], img: map["img"]);
  }
}
