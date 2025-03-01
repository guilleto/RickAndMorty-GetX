import 'package:get/get.dart';
import '../presentation/bindings/character_binding.dart';
import '../presentation/pages/welcome_page.dart';
import '../presentation/pages/character_list.dart';
import '../presentation/pages/character_info.dart';

class AppRoutes {
  static const welcome = '/welcome';
  static const characterList = '/character-list';
  static const characterInfo = '/character-info';

  static final routes = [
    GetPage(name: welcome, page: () => WelcomePage()),
    GetPage(
      name: characterList,
      page: () => CharacterListPage(),
      binding: CharacterBinding(),
    ),
    GetPage(name: characterInfo, page: () => const CharacterInfoPage()),
  ];
}