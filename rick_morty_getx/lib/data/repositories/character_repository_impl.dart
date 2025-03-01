import '../../domain/repositories/character_repository.dart';
import '../datasources/character_data_source.dart';
import '../../domain/entities/character.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Character>> getCharacters() async {
    return await remoteDataSource.fetchCharacters();
  }
}