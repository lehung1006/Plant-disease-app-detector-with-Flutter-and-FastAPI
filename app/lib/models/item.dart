class Item {
  String? id;
  String? img;
  String? name;
  String? description;

  Item({this.id, this.img, this.name, this.description});

  factory Item.fromJson(json) {
    return Item(
        id: json['id'],
        img: json['img'],
        name: json['name'],
        description: json['description']);
  }
}
