import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecases/get_characters.dart';
import '../../domain/entities/character.dart';

class CharacterController extends GetxController {
  final GetCharacters getCharactersUseCase;

  CharacterController(this.getCharactersUseCase);

  var characters = <Character>[].obs;
  var isLoading = false.obs;
  var isPaginating = false.obs;
  var hasNextPage = true.obs;
  var currentPage = 1.obs;
  var hasError = false.obs;

  var searchQuery = ''.obs;
  var selectedGender = ''.obs;
  var selectedStatus = ''.obs;

  final TextEditingController searchController = TextEditingController();

  final Map<String, String> genderMap = {
    "male": "Masculino",
    "female": "Femenino",
    "genderless": "Sin género",
    "unknown": "Desconocido"
  };

  final Map<String, String> statusMap = {
    "alive": "Vivo",
    "dead": "Muerto",
    "unknown": "Desconocido"
  };

  @override
  void onInit() {
    fetchCharacters();
    super.onInit();
  }

  void fetchCharacters({bool isNextPage = false}) async {
    if (isNextPage) {
      if (!hasNextPage.value) return;
      isPaginating.value = true;
      currentPage.value++;
    } else {
      isLoading.value = true;
      currentPage.value = 1;
      characters.clear();
    }
    try {
      final result = await getCharactersUseCase(
        page: currentPage.value,
        name: searchQuery.value,
        status: selectedStatus.value,
        gender: selectedGender.value,
      );

      characters.addAll(result["characters"]);
      hasNextPage.value = result["hasNextPage"];
      hasError.value = false;
    } catch (e) {
      hasError.value = true;
      isLoading.value = false;
      isPaginating.value = false;
    } finally {
      isLoading.value = false;
      isPaginating.value = false;
    }
    isPaginating.value = false;
  }

  void clearFilters() {
    searchQuery.value = "";
    selectedGender.value = "";
    selectedStatus.value = "";
    searchController.clear(); // Limpia el campo de búsqueda
    fetchCharacters();
  }

  void setGender(String? genderEn) {
    selectedGender.value = genderEn ?? "";
    fetchCharacters();
  }

  void setStatus(String? statusEn) {
    selectedStatus.value = statusEn ?? "";
    fetchCharacters();
  }

  // Obtener valores en español para los dropdowns
  String get genderEs => genderMap[selectedGender.value] ?? "";
  String get statusEs => statusMap[selectedStatus.value] ?? "";
}
