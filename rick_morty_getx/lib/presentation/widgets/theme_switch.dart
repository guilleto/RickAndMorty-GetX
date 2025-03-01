import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Positioned(
      bottom: 20,
      left: 20,
      child: Obx(() {
        bool isDark = themeController.isDarkMode.value;
        return FloatingActionButton.small(
          onPressed: themeController.toggleTheme,
          backgroundColor: isDark ? Colors.grey[800] : Colors.blue[100],
          child: Icon(
            isDark ? Icons.dark_mode : Icons.light_mode,
            color: isDark ? Colors.white : Colors.black87,
          ),
        );
      }),
    );
  }
}