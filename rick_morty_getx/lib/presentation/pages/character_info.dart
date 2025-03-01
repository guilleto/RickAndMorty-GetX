import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterInfoPage extends StatelessWidget {
  const CharacterInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String characterName = Get.arguments ?? "Desconocido";
    
    return Scaffold(
      appBar: AppBar(title: const Text("Información del Personaje")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nombre del Personaje:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(characterName, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
