import 'package:get/get.dart';
import '../../domain/usecases/get_characters.dart';
import '../../domain/entities/character.dart';

class CharacterController extends GetxController {
  final GetCharacters getCharactersUseCase;

  CharacterController(this.getCharactersUseCase);

  var characters = <Character>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCharacters();
    super.onInit();
  }

  void fetchCharacters() async {
    isLoading.value = true;
    characters.value = await getCharactersUseCase();
    isLoading.value = false;
  }
}