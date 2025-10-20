# Pong 05

Repositorio base para comenzar a desarrollar videojuegos 2D con **Flutter**, **Flame** y **Forge2D**.

Puedes ver una demo del proyecto en:

https://www.desarrollolibre.net/public/flutter/forge/pong05/

---

##  Descripción

Este repositorio proporciona una estructura inicial para implementar ejemplos prácticos del libro/curso “Primeros pasos con Forge2D y Flame con Flutter”, como se detalla en el blog introductorio mencionado más abajo.

Este juego muestra una demo de un juego tipo Pong

## ¿Qué encontrarás aquí?

- Proyecto Flutter con estructura multiplataforma (`android/`, `ios/`, `web/`, `macos/`, `windows/`, `linux/`).
- Carpetas clave como `lib/`, `assets/images/`, y `test/`.
- Archivos de configuración típicos de Flutter (`pubspec.yaml`, `.gitignore`, `analysis_options.yaml`, etc.).

Esta base está pensada para que agregues progresivamente el contenido del libro y practiques cada capítulo en un entorno limpio y organizado.

---

##  Acerca del recurso “Primeros pasos con Forge2D y Flame con Flutter”

Se trata de un recurso **altamente práctico**, que te guía paso a paso desde configurar tu proyecto hasta crear juegos completos con física 2D. Está dirigido a quienes ya conocen Flutter y desean aplicarlo al desarrollo de videojuegos mediante Flame y Forge2D :contentReference[oaicite:0]{index=0}.

### Contenido organizado en capítulos/secciones:

1. **Inicio del proyecto**: Configuración de Flutter con Flame y Forge2D.  
2. **Fundamentos de Forge2D**: Cuerpos físicos, impulsos, velocidad, fuerzas, colisiones, manejo del mundo físico, etc.  
3. **Ejemplos pequeños**: Ilustraciones prácticas de los conceptos anteriores.  
4. **Juego de plataformas**: Movimiento horizontal y saltos usando velocidad lineal y mapas tipo tile.  
5. **Juego estilo Angry Birds**: Arrastrar un objeto y lanzarlo con impulso vectorial.  
6. **Juego estilo Pinball**: Bola, brazo móvil, obstáculos, meta movilizable.  
7. **Juego tipo Pong**: Paredes, barras, ángulos de impacto de la pelota :contentReference[oaicite:1]{index=1}.

La versión publicada en Leanpub fue actualizada por última vez el **7 de julio de 2025** :contentReference[oaicite:2]{index=2}.

---

##  Enlaces útiles

- Blog introductorio: **[Primeros pasos con Forge2D y Flame con Flutter](https://www.desarrollolibre.net/blog/flutter/primeros-pasos-con-forge2d-y-flame-con-flutter)**  
- Libro/curso completo: **[Forge2D + Flame + Flutter (Leanpub)](https://www.desarrollolibre.net/libros/forge2d-flame-flutter)**

---

##  ¿Cómo empezar?

1. Clona este repositorio.
2. Abre el proyecto con tu IDE o editor favorito (Visual Studio Code, Android Studio, etc.).
3. Consulta el blog introductorio y usa los capítulos del libro como guía paso a paso.
4. Agrega ejemplos del curso dentro de `lib/`, ajusta `pubspec.yaml` para incluir assets necesarios y prueba tu juego.

---

## Estructura recomendada

```text
curso-libro-bases-flame-forge/
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
├── lib/
│   └── main.dart    ← punto de entrada vacío que servirá de base para los ejemplos
├── assets/
│   └── images/
├── test/
├── pubspec.yaml
├── analysis_options.yaml
├── README.md
└── .gitignore
