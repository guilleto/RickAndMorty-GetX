import '../../domain/repositories/character_repository.dart';
import '../datasources/character_data_source.dart';


class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> getCharacters({int page = 1, String? name, String? status, String? gender}) async {
    return await remoteDataSource.fetchCharacters(page: page, name: name, status: status, gender: gender);
  }
}