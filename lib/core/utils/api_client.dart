import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api"));

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }
}