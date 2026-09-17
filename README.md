# Peliculas 20263

Aplicacion Flutter para consultar peliculas actualmente en cartelera y peliculas populares usando la API de [The Movie Database (TMDB)](https://www.themoviedb.org/).

## Funcionalidades

- Lista de peliculas en cartelera con carrusel de posters.
- Carrusel de peliculas populares.
- Pantalla de detalles para cada pelicula.
- Poster principal expandido con comportamiento `SliverAppBar`: al desplazarse, el poster se retrae y queda como miniatura junto al titulo.
- Descripcion de la pelicula y fecha de estreno.
- Carrusel horizontal del reparto con fotografia, nombre del actor y personaje.
- Cache en memoria del reparto consultado para evitar peticiones repetidas durante la sesion.

## Requisitos

- Flutter compatible con Dart `3.13.1` o superior.
- Un dispositivo, emulador Android/iOS o navegador configurado para Flutter.
- Una clave de acceso de TMDB.

Comprueba que Flutter esta correctamente instalado con:

```bash
flutter doctor
```

## Instalacion y ejecucion

Clona el repositorio y entra en la carpeta del proyecto:

```bash
git clone <url-del-repositorio>
cd peliculas20263
```

Instala las dependencias:

```bash
flutter pub get
```

Ejecuta la aplicacion:

```bash
flutter run
```

Para consultar los dispositivos disponibles:

```bash
flutter devices
```

## Estructura principal

```text
lib/
├── main.dart                    # Configuracion de Provider y rutas
├── models/                      # Modelos de peliculas y reparto
├── providers/
│   └── movie_provider.dart      # Peticiones a TMDB y cache del reparto
├── screens/
│   ├── home_screen.dart         # Cartelera y peliculas populares
│   └── details_screen.dart      # Detalles y SliverAppBar del poster
└── widgets/
    ├── card_slider.dart         # Carrusel de peliculas populares
    └── card_swiper.dart          # Carrusel de peliculas en cartelera
```

## API de TMDB

La aplicacion consume estos endpoints:

- `GET /3/movie/now_playing`
- `GET /3/movie/popular`
- `GET /3/movie/{movie_id}/credits`

Las peticiones usan el idioma `es-MX` y las imagenes se cargan desde los servidores de TMDB.

> Importante: actualmente la clave de TMDB esta definida directamente en `lib/providers/movie_provider.dart`. No publiques una clave real en un repositorio publico. Para produccion, utiliza variables de entorno, configuracion por plataforma o un backend intermedio, y revoca la clave si ya fue expuesta.

## Calidad y validacion

Analiza todo el proyecto con:

```bash
flutter analyze
```

Ejecuta las pruebas con:

```bash
flutter test
```

## Dependencias principales

- [`provider`](https://pub.dev/packages/provider): gestion del estado.
- [`http`](https://pub.dev/packages/http): peticiones HTTP a TMDB.
- [`card_swiper`](https://pub.dev/packages/card_swiper): carruseles de peliculas.