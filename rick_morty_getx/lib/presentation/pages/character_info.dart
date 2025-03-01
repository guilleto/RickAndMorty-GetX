import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/character.dart';

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
          Text("Estado: ${character.status}", style: const TextStyle(fontSize: 18)),
          Text("Especie: ${character.species}", style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}