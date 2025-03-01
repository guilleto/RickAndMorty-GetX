# 🛸 Rick and Morty Character App

Una aplicación en Flutter para explorar personajes de **Rick and Morty**, utilizando la API pública de [Rick and Morty API](https://rickandmortyapi.com/).\
Incluye funcionalidades de búsqueda, filtrado, paginación y modo oscuro.

---

## 📌 **Tecnologías utilizadas**

- **Flutter 3.22.1** (Canal Stable)
- **Dart 3.4.1**
- **GetX** para gestión de estado y navegación
- **Dio** para realizar peticiones a la API

---

## 📌 **Estructura del proyecto**

El proyecto sigue una arquitectura **limpia y modular**, dividiendo la lógica en capas bien definidas:

```
/lib
│── /config             # Configuración general (rutas, temas, controladores globales)
│── /core               # Funcionalidades y utilidades compartidas
│   │── /utils          # Clases de ayuda y métodos reutilizables
│── /data               # Lógica de acceso a datos (modelos, repositorios, API)
│   │── /datasources    # Fuentes de datos (API, almacenamiento local, etc.)
│   │── /models         # Definición de estructuras de datos
│   │── /repositories   # Implementaciones de los repositorios
│── /domain             # Entidades y casos de uso (lógica de negocio)
│   │── /entities       # Modelos de negocio puros
│   │── /repositories   # Definición de interfaces para acceso a datos
│   │── /usecases       # Casos de uso de la aplicación
│── /presentation       # UI y controladores de pantalla
│   │── /bindings       # Inyección de dependencias para cada pantalla
│   │── /controllers    # Controladores de estado y lógica de UI
│   │── /pages          # Pantallas principales
│   │── /widgets        # Componentes reutilizables
│── main.dart           # Punto de entrada de la aplicación
```


## 📌 **Cómo ejecutar el proyecto desde cero**

### 1️⃣ **Instalar dependencias**

Asegúrate de tener Flutter instalado en tu máquina.\
Puedes verificar tu instalación con:

```sh
flutter --version
```

Si aún no lo tienes, sigue las instrucciones oficiales: [Instalar Flutter](https://flutter.dev/docs/get-started/install).

### 2️⃣ **Clonar el repositorio**

```sh
git clone https://github.com/guilleto/RickAndMorty-GetX.git
cd RickAndMorty-GetX
```

### 3️⃣ **Instalar paquetes**

```sh
flutter pub get
```

### 4️⃣ **Configurar los assets**

Asegúrate de que la imagen de fondo esté bien referenciada en `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/rick_and_morty_background.jpg
```

Si agregaste nuevos assets, corre:

```sh
flutter pub get
```

### 5️⃣ **Ejecutar el proyecto**

```sh
flutter run
```

Si quieres ejecutarlo en un dispositivo específico:

```sh
flutter run -d chrome    # Para Web
flutter run -d android   # Para Android
flutter run -d ios       # Para iOS (requiere macOS)
```

---

## 📌 **Características del Proyecto**

✅ **Lista de personajes** con paginación\
✅ **Búsqueda y filtrado avanzado**\
✅ **Modo oscuro / claro con switch flotante**\
✅ **Detalle del personaje** con datos y primer episodio\
✅ \*\*Diseño optimizado con ****`GetX`**** y \*\***`ThemeData`**

---

## 📌 **Créditos**

Desarrollado por Guillermo Correa 🛸🚀 para  Prueba técnica - Estrellas (Flutter mobile)\
API utilizada: [Rick and Morty API](https://rickandmortyapi.com/)

---

🔥 ¡Disfruta explorando el multiverso de Rick and Morty con esta app! 😃

