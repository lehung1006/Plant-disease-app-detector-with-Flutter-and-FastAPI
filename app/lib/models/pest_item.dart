class PestItem {
  String? id;
  String? name;
  String? img;
  String? description;

  PestItem({this.id, this.name, this.img, this.description});

  factory PestItem.fromJson(json) {
    return PestItem(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        description: json["img"]);
  }
}
