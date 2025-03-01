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
    final Color cardBackground = Theme.of(context).brightness == Brightness.dark
        ? const Color.fromARGB(255, 173, 173, 173).withOpacity(0.5)
        : Colors.blueGrey.shade50;
    final Color textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Informacion del personaje"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Imagen del personaje
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(character.image, height: 150),
              ),
              const SizedBox(height: 10),
              // Nombre del personaje
              Text(
                character.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const Divider(),

                _infoRow(
                    Icons.person,
                    "Género",
                    TranslationUtils.translate(
                        TranslationTypes.gender, character.gender)),
                _infoRow(
                    Icons.category,
                    "Especie",
                    TranslationUtils.translate(
                        TranslationTypes.species, character.species)),
                _infoRow(
                    Icons.location_on, "Ubicación", character.location['name']),
                if (character.origin['name'].isNotEmpty)
                  _infoRow(Icons.public, "Origen", character.origin['name']),

                // Botón para abrir el primer episodio
                const SizedBox(height: 16),
                if (character.episode!.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Primer episodio:",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () => {},
                        icon: const Icon(Icons.play_circle_filled),
                        label: Text('${character.episode?.first}'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.lightBlueAccent,
                          side: const BorderSide(color: Colors.lightBlueAccent),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
  }

  /// Widget para mostrar una fila de información con ícono y texto
  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
