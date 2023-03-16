class PlantDetail {
  String? id;
  String? name;
  String? imgs;
  String? scienceName;
  String? description;
  String? plantType;
  String? lifeSpan;
  String? bloomTime;
  String? plantHeight;
  String? spread;
  String? habitat;
  String? difficultyRating;
  String? soil;
  String? hardiness;
  String? hardinessZone;
  String? water;
  String? sunlight;
  String? fertilization;
  String? plantingTime;
  String? harvestTime;
  String? propagation;
  String? pests;
  String? uses;

  PlantDetail(
      {this.id,
      this.name,
      this.imgs,
      this.scienceName,
      this.description,
      this.plantType,
      this.lifeSpan,
      this.bloomTime,
      this.plantHeight,
      this.spread,
      this.habitat,
      this.difficultyRating,
      this.soil,
      this.hardiness,
      this.hardinessZone,
      this.water,
      this.sunlight,
      this.fertilization,
      this.plantingTime,
      this.harvestTime,
      this.propagation,
      this.pests,
      this.uses});

  factory PlantDetail.fromJson(json) {
    return PlantDetail(
        id: json['id'],
        name: json['name'],
        imgs: json['img'],
        scienceName: json['science_name'],
        description: json['description'],
        plantType: json['plant_type'],
        lifeSpan: json['lifespan'],
        bloomTime: json['bloom_time'],
        plantHeight: json['plant_height'],
        spread: json['spread'],
        habitat: json['habitat'],
        difficultyRating: json['difficulty_rating'],
        soil: json['soil'],
        hardiness: json['hardiness'],
        hardinessZone: json['hardiness_zone'],
        water: json['water'],
        sunlight: json['sunlight'],
        fertilization: json['fertilization'],
        plantingTime: json['planting_time'],
        harvestTime: json['harvest_time'],
        propagation: json['propagation'],
        pests: json['pests'],
        uses: json['uses']);
  }
}
