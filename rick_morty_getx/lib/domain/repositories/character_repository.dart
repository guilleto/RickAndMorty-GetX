import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Map<String, dynamic>> getCharacters({int page, String? name, String? status, String? gender});
}