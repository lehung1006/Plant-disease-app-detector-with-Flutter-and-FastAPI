class Item {
  String? id;
  String? img;
  String? name;
  String? scienceName;
  String? description;

  Item({this.id, this.img, this.name, this.scienceName, this.description});

  factory Item.fromJson(json) {
    return Item(
        id: json['id'],
        img: json['img'].first,
        name: json['name'],
        description: json['description']);
  }

  Map<String,dynamic> toJson() {
    return {
      "id": id,
      "img": [img],
      "name": name,
      "description": description
    };
  }
}
