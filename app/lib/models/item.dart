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
        img: json['img'] != null ? json['img'].first : '',
        name: json['name'],
        description: json['description']);
  }

  Map<String, String> toJson() {
    return {
      'id': id ?? '',
      'img': img ?? '',
      'name': name ?? '',
      'science_name': scienceName ?? '',
      'description': description ?? ''
    };
  }

  Map<String, String> toHistoryItemJson() {
    return {
      'img': img ?? '',
      'title': name ?? '',
      'sub_title': description ?? '',
      'type': '0'
    };
  }
}
