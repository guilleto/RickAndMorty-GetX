import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../controllers/welcome_controller.dart';
import '../widgets/theme_switch.dart';

class WelcomePage extends StatelessWidget {
  final WelcomeController controller = Get.put(WelcomeController());
  final ThemeController themeController = Get.find();

  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Ajusta la opacidad para mejor legibilidad
              child: Image.asset(
                'assets/images/Beautiful-Rick-And-Morty-Phone-Wallpaper-HD.jpg', // 📌 Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Bienvenido",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text("Ingrese su código de acceso para continuar",
                    textAlign: TextAlign.center),
                const SizedBox(height: 20),
                TextField(
                  decoration:
                      const InputDecoration(labelText: "Código de acceso"),
                  onChanged: (value) => controller.code.value = value,
                ),
                const SizedBox(height: 20),
                Obx(() => Card(
                      color: themeController.isDarkMode.value
                          ? Colors.black
                          : const Color.fromARGB(220, 255, 255, 255),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Reglas del Código:",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            ...controller.validationResults.entries
                                .map((entry) {
                              final isValid = entry.value;
                              final color = isValid == null
                                  ? Colors.grey // No intentado
                                  : isValid
                                      ? Colors.green // Correcto
                                      : Colors.red; // Incorrecto
                              final icon = isValid == null
                                  ? Icons.pix_rounded // No intentado
                                  : isValid
                                      ? Icons.check_circle // Correcto
                                      : Icons.cancel; // Incorrecto
                              return Row(
                                children: [
                                  Icon(icon, color: color, size: 18),
                                  const SizedBox(width: 5),
                                  Text(entry.key,
                                      style: TextStyle(color: color)),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: controller.validateCode,
                        child: const Text("Validar Código"),
                      )),
              ],
            ),
          ),
          const ThemeSwitch(),
        ],
      ),
    );
  }
}
