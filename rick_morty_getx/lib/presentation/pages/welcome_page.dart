import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomePage extends StatelessWidget {
  final WelcomeController controller = Get.put(WelcomeController());

  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenido",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("Ingrese su código de acceso para continuar",
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: "Código de acceso"),
              onChanged: (value) => controller.code.value = value,
            ),
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
    );
  }
}
