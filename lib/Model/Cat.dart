class Cat {
  final int catId;
  final String catName;
  final String species;
  final int? age = null;
  final String? sex = null;
  Cat({
    required this.catId,
    required this.catName,
    required this.species,
    int? age,
    String? sex,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      catId: json['catId'],
      catName: json['catName'],
      species: json['species'],
      age: json['age'],
      sex: json['sex'],
    );
  }
}
