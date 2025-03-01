import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/app_routes.dart';
import 'config/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Character App',
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.welcome, // Define la pantalla de inicio
      getPages: AppRoutes.routes, // Carga las rutas definidas en app_routes.dart
    );
  }
}

