import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/character_list_controller.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CharacterController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Personajes de Rick and Morty")),
      body: Obx(() {
        if (controller.isLoading.value)
          return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            final character = controller.characters[index];
            return ListTile(
              leading: Image.network(character.image),
              title: Text(character.name),
              subtitle: Text(character.species),
              onTap: () {
                Get.toNamed('/character-info', arguments: character);
              },
            );
          },
        );
      }),
    );
  }
}
