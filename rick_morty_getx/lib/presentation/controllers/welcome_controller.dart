import 'package:get/get.dart';


class WelcomeController extends GetxController {
  var code = ''.obs;
  var isLoading = false.obs;

  void validateCode() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1500 )); // simula una espera de 1.5 segundos para mostrar la carga
    isLoading.value = false;
    Get.offAndToNamed('/character-list'); // Navega a la pantalla de lista de personajes
  }
}