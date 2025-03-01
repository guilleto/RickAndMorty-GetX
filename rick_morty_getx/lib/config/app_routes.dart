import 'package:get/get.dart';
import '../presentation/pages/welcome_page.dart';
import '../presentation/pages/character_list.dart';
import '../presentation/pages/character_info.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String characterList = '/character-list';
  static const String characterInfo = '/character-info';

  static final routes = [
    GetPage(name: welcome, page: () => WelcomePage()),
    GetPage(name: characterList, page: () => CharacterListPage()),
    GetPage(name: characterInfo, page: () => const CharacterInfoPage()),
  ];
}
