class Item {
  String? id;
  String? img;
  String? name;
  String? scienceName;
  String? description;

  Item({this.id, this.img, this.name,this.scienceName, this.description});

  factory Item.fromJson(json) {
    return Item(
        id: json['id'],
        img: json['img'] != null ? json['img'].first : '',
        name: json['name'],
        scienceName: json['science_name'] ?? '',
        description: json['description']);
  }
}
