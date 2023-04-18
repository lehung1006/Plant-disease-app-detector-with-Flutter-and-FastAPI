import 'dart:math';

class HistoryItem {
  String? key;
  String? img;
  String? title;
  String? subTitle;
  int? type;
  String? date;

  HistoryItem(
      {this.key, this.img, this.title, this.subTitle, this.type, this.date});

  factory HistoryItem.fromJson(json) {
    return HistoryItem(
        key: json["key"],
        img: json["img"],
        title: json["title"],
        subTitle: json["sub_title"],
        type: json["type"],
        date: json["date"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'img': img,
      'title': title,
      'sub_title': subTitle,
      'type': type,
      'date': date,
    };
  }

  static T _getRandomElement<T>(List<T> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  static String generateKey(String img) {
    var key = [];
    for (var i = 0; i < 12; i++) {
      key.add(_getRandomElement(img.split('')));
    }
    return key.join();
  }
}
