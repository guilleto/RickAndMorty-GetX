import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/translation_utils.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/translation_types.dart';

class CharacterInfoPage extends StatelessWidget {
  const CharacterInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Character character = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(character.image, width: 200, height: 200),
          const SizedBox(height: 20),
          Text(
              "Género: ${TranslationUtils.translate(TranslationTypes.gender, character.gender)}",
              style: const TextStyle(fontSize: 18)),
          Text(
              "Estado: ${TranslationUtils.translate(TranslationTypes.status, character.status)}",
              style: const TextStyle(fontSize: 18)),
          Text(
              "Especie: ${TranslationUtils.translate(TranslationTypes.species, character.species ?? 'Desconocido')}",
              style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
