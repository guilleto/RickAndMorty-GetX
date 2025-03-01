import 'package:get/get.dart';

import '../../core/utils/api_client.dart';
import '../../data/datasources/character_data_source.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../domain/repositories/character_repository.dart';
import '../../domain/usecases/get_characters.dart';
import '../controllers/character_list_controller.dart';

class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<CharacterRemoteDataSource>(() => CharacterRemoteDataSource(Get.find()));
    Get.lazyPut<CharacterRepository>(() => CharacterRepositoryImpl(Get.find()));
    Get.lazyPut<GetCharacters>(() => GetCharacters(Get.find()));
    Get.lazyPut<CharacterController>(() => CharacterController(Get.find()));
  }
}