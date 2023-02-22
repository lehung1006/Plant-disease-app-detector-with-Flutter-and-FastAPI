class ProductDetail {
  String? name;
  int? category;
  double? price;
  String? imgBase64;

  ProductDetail({this.name, this.category, this.price, this.imgBase64});

  factory ProductDetail.fromJson(json) {
    return ProductDetail(
        name: json['name'],
        category: json['category'],
        price: json['price'],
        imgBase64: json['imgBase64']);
  }
}
