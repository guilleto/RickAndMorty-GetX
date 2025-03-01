import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_getx/domain/entities/translation_types.dart';

import '../controllers/character_list_controller.dart';
import '../widgets/character_card.dart';
import '../widgets/filter_dropdown.dart';

class CharacterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CharacterController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Personajes de Rick and Morty"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Barra de búsqueda
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller
                            .searchController, // Conecta el controlador
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.person_search),
                            onPressed: () {
                              controller.searchQuery.value =
                                  controller.searchController.text;
                              controller.fetchCharacters();
                            },
                          ),
                          hintText: "Buscar por nombre...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.filter_alt_off_outlined),
                      onPressed: () {
                        controller.clearFilters();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Filtros de Género y Estado
                Row(
                  children: [
                    Expanded(
                      child: FilterDropdown(
                        label: "Filtrar por género",
                        selectedValue: controller.selectedGender,
                        type: TranslationTypes.gender,
                        onChanged: controller.setGender,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilterDropdown(
                        label: "Filtrar por estado",
                        selectedValue: controller.selectedStatus,
                        type: TranslationTypes.status,
                        onChanged: controller.setStatus,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              controller.fetchCharacters(isNextPage: true);
            }
            return true;
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.hasError.value ? 1 : 2, // 2 personajes por fila
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: controller.hasError.value ? 1 : controller.characters.length +
                (controller.hasNextPage.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (controller.hasError.value) {
                return const Center(
                    child: Column(
                  children: [
                    Icon(Icons.no_accounts),
                    SizedBox(height: 10),
                    Text("No se encontraron Personajes"),
                  ],
                ));
              }else
              if (index == controller.characters.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final character = controller.characters[index];
              return CharacterCard(character: character);
            },
          ),
        );
      }),
    );
  }
}
