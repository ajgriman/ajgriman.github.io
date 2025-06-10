---
layout: project
lang: es
page_id: rails-watch-lists
title: "Listas de Peliculas Rails"
short_description: "Plataforma de listas de películas con gestión CRUD, búsqueda Tom Select, comentarios en bookmarks, y reseñas con star-rating.js. Experiencia mejorada con animaciones Typed.js, efectos de scroll AOS.js, y tarjetas responsivas Bootstrap 5. Construido en el bootcamp de Le Wagon."
card_image_path: "https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list1.gif?updatedAt=1749384953788"
image_path: "https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list2.png?updatedAt=1749384855468"
image_path_alt: "https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list3.png?updatedAt=1749384880152"
video_url: "https://youtu.be/A84wPcYgAK8"
date: 2025-06-08
tech_stack: ["Ruby On Rails", "Ruby", "JavaScript", "Bootstrap", "PostgreSQL"]
repo_url: "https://github.com/ajgriman/rails-watch-list"
live_url: ""
# tags: []
---

Desarrollé una app de listas de películas con creación/gestión de listas, bookmarking con comentarios, y reseñas. Funcionalidades clave:  
- Listas Dinámicas: Operaciones CRUD con URLs de imágenes (validadas) y tarjetas responsive  
- Bookmarking Inteligente: Búsquedas con Tom Select + validación de comentarios (6+ caracteres)  
- Ecosistema de Reseñas: Integración de star-rating.js para valoraciones 1-5 + reseñas con SVGs personalizados  

Dominé retos de integración JS en Rails 7:  
- Problemas con Importmap: Diagnosticé conflictos UMD/IIFE vs. módulos ES en AOS.js/Star-Rating.js  
- Soluciones Locales: Modifiqué código fuente (ej: enlaces `this`→`window`) para carga local de módulos ES  
- Optimización Turbo: Inicialización en `turbo:load` con tiempos de espera para estabilidad DOM  
- Pruebas Rigurosas: Configuré submódulo RSpec para validaciones (unicidad, restricciones FK) y bloqueos de borrado  

Entregué UX pulido mediante:  
- UI Animada: Títulos con Typed.js + revelado de tarjetas con AOS.js  
- Bootstrap 5 + SCSS: Banners responsive con imágenes de respaldo  
- Integridad de Datos: Semillas de películas en PostgreSQL con salvaguardas `dependent: :restrict_with_error`  
- Lecciones Clave: Resolución de rutas de assets (SVGs), conflictos CSS y condiciones de carrera en inicialización  
