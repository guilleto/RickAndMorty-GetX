import 'package:get/get.dart';

class WelcomeController extends GetxController {
  var code = ''.obs;
  var isLoading = false.obs;
  var validationAttempted =
      false.obs; // Indica si el usuario ya intentó validar
  var validationResults = <String, bool?>{
    "Debe tener entre 4 y 6 caracteres.": null,
    "Debe contener al menos una mayúscula.": null,
    "Debe contener al menos un número.": null,
  }.obs;

  void validateCode() async {
    validationAttempted.value = true; // Se ha intentado validar
    String input = code.value.trim();

    // Evaluamos cada regla
    validationResults["Debe tener entre 4 y 6 caracteres."] =
        input.length >= 4 && input.length <= 6;
    validationResults["Debe contener al menos una mayúscula."] =
        RegExp(r'[A-Z]').hasMatch(input);
    validationResults["Debe contener al menos un número."] =
        RegExp(r'[0-9]').hasMatch(input);

    // Si hay algún error, no continuamos
    if (validationResults.containsValue(false)) return;

    // Simulamos la carga
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    isLoading.value = false;

    // Navegamos a la lista de personajes
    Get.offAndToNamed('/character-list');
  }
}
