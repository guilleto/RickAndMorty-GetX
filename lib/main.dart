import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/app_routes.dart';
import 'config/theme.dart';
import 'presentation/controllers/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
        Get.put(ThemeController()); // Inicializar el controlador

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick and Morty App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: AppRoutes.welcome,
          getPages: AppRoutes.routes,
        ));
  }
}
