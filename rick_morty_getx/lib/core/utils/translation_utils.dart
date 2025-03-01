import '../../domain/entities/translation_types.dart';

class TranslationUtils {
  static final Map<String, String> genderMap = {
    "male": "Masculino",
    "female": "Femenino",
    "genderless": "Sin género",
    "unknown": "Desconocido"
  };

  static final Map<String, String> statusMap = {
    "alive": "Vivo",
    "dead": "Muerto",
    "unknown": "Desconocido"
  };

  static final Map<String, String> speciesMap = {
    "human": "Humano",
    "alien": "Alienígena",
    "robot": "Robot",
    "unknown": "Desconocido"
  };

  static Map<String, String> getMap(TranslationTypes type) {
    switch (type) {
      case TranslationTypes.gender:
        return genderMap;
      case TranslationTypes.status:
        return statusMap;
      case TranslationTypes.species:
        return speciesMap;
      default:
        return {};
    }
  }

  static String translate(TranslationTypes type, String value) {
    return getMap(type)[value.toLowerCase()] ?? "Desconocido";
  }
}
