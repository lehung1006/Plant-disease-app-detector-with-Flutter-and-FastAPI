class ClassifyResult {
  final int type;
  String? name;
  String? objectId;
  String? scienceName;
  String? description;

  ClassifyResult(
      {required this.type,
      this.name,
      this.objectId,
      this.scienceName,
      this.description});

  factory ClassifyResult.fromJson(Map<String, dynamic> json, int type) {
    return ClassifyResult(
        type: type,
        name: json['name'],
        objectId: json['id'],
        scienceName: json['science_name'] ?? '',
        description: json['description']);
  }
}
