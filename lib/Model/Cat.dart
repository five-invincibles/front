class Cat {
  final int catId;
  final String catName;
  final String species;
  final String? age;
  final String? sex;
  final String? longitude;
  final String? latitude;
  final String? imageUrl;

  Cat({
    required this.catId,
    required this.catName,
    required this.species,
    this.age,
    this.sex,
    this.longitude,
    this.latitude,
    this.imageUrl,
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
      imageUrl: json['imageUrl'],
    );
  }
}
