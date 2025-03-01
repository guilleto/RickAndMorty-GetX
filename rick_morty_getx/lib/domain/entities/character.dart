class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String gender;
  final Map<String, dynamic> location;
  final Map<String, dynamic> origin;
  final List<String>? episode;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
    required this.gender,
    required this.location,
    required this.species,
    required this.origin,
    this.episode,
  });
}