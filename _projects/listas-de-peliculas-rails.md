---
layout: project
lang: es
page_id: rails-watch-lists
title: 'Listas de Películas Rails'
short_description: 'Plataforma de listas de películas con gestión CRUD, búsqueda Tom Select, comentarios en bookmarks y reseñas con star-rating.js. Experiencia mejorada con animaciones Typed.js, efectos de scroll AOS.js y tarjetas responsivas Bootstrap 5. Construido en el bootcamp de Le Wagon.'
card_image_path: 'https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list1.gif?updatedAt=1749384953788'
image_path: 'https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list2.png?updatedAt=1749384855468'
image_path_alt: &image_path_alt_value 'https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list3.png?updatedAt=1749384880152'
image: *image_path_alt_value
video_url: 'https://youtu.be/A84wPcYgAK8'
date: 2025-06-08
tech_stack: ['Ruby On Rails', 'Ruby', 'JavaScript', 'Bootstrap', 'PostgreSQL']
repo_url: 'https://github.com/ajgriman/rails-watch-list'
live_url: ''
# tags: []
---

Se desarrolló una aplicación de listas de películas que permite crear y gestionar listas, marcar películas con comentarios personalizados y realizar reseñas. Las características clave incluyen:

- Listas Dinámicas: Operaciones CRUD con URLs de imágenes (validadas) y tarjetas responsivas
- Bookmarking Inteligente: Búsqueda con Tom Select y validación de comentarios (6+ caracteres)
- Ecosistema de Reseñas: Integración de star-rating.js para valoraciones de 1 a 5 estrellas y reseñas de texto mostradas con SVGs personalizados

Se abordaron los retos de integración de JavaScript en Rails 7 de la siguiente manera:

- Problemas con Importmap: Se diagnosticaron conflictos UMD/IIFE vs. módulos ES en AOS.js/Star-Rating.js
- Soluciones Locales: Se modificó el código fuente de las librerías (por ejemplo, enlaces `this`→`window`) para permitir la carga local de módulos ES
- Optimización Turbo: Las librerías se inicializaron en `turbo:load` con tiempos de espera para la estabilidad del DOM
- Pruebas Rigurosas: Se configuró un submódulo RSpec para validaciones de modelos (unicidad, restricciones FK) y bloqueos de borrado de películas

Se entregó una experiencia de usuario pulida mediante:

- UI Animada: Títulos con Typed.js y revelado de tarjetas con AOS.js
- Bootstrap 5 y SCSS personalizado: Banners responsivos con imágenes de respaldo
- Integridad de Datos: Semillas de películas en PostgreSQL con salvaguardas `dependent: :restrict_with_error`
- Resolución de Problemas: Se resolvieron rutas de assets (SVGs), conflictos de CSS y condiciones de carrera en la inicialización
