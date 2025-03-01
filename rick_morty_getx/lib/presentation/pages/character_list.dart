import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListController extends GetxController {
  var characters = ['Personaje 1', 'Personaje 2', 'Personaje 3'].obs;
}

class CharacterListPage extends StatelessWidget {
  final CharacterListController controller = Get.put(CharacterListController());

  CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Personajes")),
      body: Obx(() => ListView.builder(
            itemCount: controller.characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.characters[index]),
                onTap: () {
                  Get.toNamed('/character-info', arguments: controller.characters[index]);
                },
              );
            },
          )),
    );
  }
}
