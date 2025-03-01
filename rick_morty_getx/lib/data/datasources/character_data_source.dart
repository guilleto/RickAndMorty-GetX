import 'package:dio/dio.dart';
import '../models/character_model.dart';
import '../../core/utils/api_client.dart';

class CharacterRemoteDataSource {
  final ApiClient apiClient;

  CharacterRemoteDataSource(this.apiClient);

  Future<Map<String, dynamic>> fetchCharacters({int page = 1, String? name, String? status, String? gender}) async {
    try {
      String query = "?page=$page";
      if (name != null && name.isNotEmpty) query += "&name=$name";
      if (status != null && status.isNotEmpty) query += "&status=$status";
      if (gender != null && gender.isNotEmpty) query += "&gender=$gender";

      Response response = await apiClient.get("/character$query");
      List<dynamic> results = response.data["results"];
      return {
        "characters": results.map((json) => CharacterModel.fromJson(json)).toList(),
        "hasNextPage": response.data["info"]["next"] != null
      };
    } catch (e) {
      throw Exception("Error obteniendo personajes");
    }
  }
}
