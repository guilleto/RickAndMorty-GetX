class Character {
  final int id;
  final String name;
  final String status;
  final String? species;
  final String image;
  final String gender;
  final String location;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
    required this.gender,
    required this.location,
    this.species,
  });
}
