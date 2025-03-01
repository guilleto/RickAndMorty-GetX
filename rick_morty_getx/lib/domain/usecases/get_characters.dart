import '../repositories/character_repository.dart';

class GetCharacters {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  Future<Map<String, dynamic>> call({int page = 1, String? name, String? status, String? gender}) async {
    return await repository.getCharacters(page: page, name: name, status: status, gender: gender);
  }
}