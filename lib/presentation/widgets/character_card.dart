import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_getx/domain/entities/translation_types.dart';

import '../../core/utils/translation_utils.dart';
import '../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/character-info', arguments: character);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(character.image,
                    fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(character.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 4),
                    Text(
                        "Género: ${TranslationUtils.translate(TranslationTypes.gender, character.gender)}",
                        style: const TextStyle(fontSize: 12)),
                    Text(
                        "Estado: ${TranslationUtils.translate(TranslationTypes.status,character.status)}",
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
