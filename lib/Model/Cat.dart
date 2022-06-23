class Cat {
  final int catId;
  final String catName;
  final String species;
  final String? age;
  final String? sex;
  final double? longitude;
  final double? latitude;
  
  Cat({
    required this.catId,
    required this.catName,
    required this.species,
    this.age,
    this.sex,
    this.longitude,
    this.latitude,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      catId: json['catId'],
      catName: json['catName'],
      species: json['species'],
      age: json['age'],
      sex: json['sex'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}
