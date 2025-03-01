import 'package:dio/dio.dart';
import '../models/character_model.dart';
import '../../core/utils/api_client.dart';

class CharacterRemoteDataSource {
  final ApiClient apiClient;

  CharacterRemoteDataSource(this.apiClient);

  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      Response response = await apiClient.get("/character");
      List<dynamic> results = response.data["results"];
      return results.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Error obteniendo personajes");
    }
  }
}