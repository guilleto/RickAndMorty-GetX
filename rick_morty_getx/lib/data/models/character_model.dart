import '../../domain/entities/character.dart';

class CharacterModel extends Character {
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.image,
    required super.gender,
    required super.location,
    required super.origin,
    super.episode,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      image: json["image"],
      gender: json["gender"],
      location: json["location"],
      origin: json["origin"],
      episode: (json["episode"] as List<dynamic>?)
          ?.map((e) => _extractEpisodeNumber(e.toString()))
          .toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "status": status,
      "species": species,
      "image": image,
      "gender": gender,
      "location": location,
      "origin": origin,
      "episode": episode ?? [],
    };
  }

  static String _extractEpisodeNumber(String url) {
    return url.split('/').last;
  }

}