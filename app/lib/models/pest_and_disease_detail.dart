class PestAndDiseaseDetail {
  String? name;
  List<dynamic>? imgs;
  String? description;
  String? solution;
  String? prevention;

  PestAndDiseaseDetail(
      {this.name, this.imgs, this.description, this.solution, this.prevention});

  factory PestAndDiseaseDetail.fromJson(json) {
    return PestAndDiseaseDetail(
      name: json['name'],
      imgs: json['img'],
      description: json['description'],
      solution: json['solutions'] ?? '',
      prevention: json['prevention'],
    );
  }
}
