---
layout: project
lang: es
page_id: rails-longest-word-game
title: 'Rails Juego de la palabra más larga'
short_description: 'Este juego de palabras en Rails transforma rejillas de letras estáticas en interacciones dinámicas. Desarrollado en el bootcamp de Le Wagon.'
card_image_path: 'https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word-game1.png?updatedAt=1748955639638'
image_path: 'https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word2.png?updatedAt=1748956151228'
image_path_alt: 'https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word3.png?updatedAt=1748956113489'
image: 'https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word3.png?updatedAt=1748956113489'
video_url: 'https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word-game.mp4?updatedAt=1748955223374'
date: 2025-06-03
tech_stack: ['Ruby', 'Ruby On Rails', 'Bootstrap', 'HTML', 'Git']
repo_url: 'https://github.com/ajgriman/rails-longest-word-game'
live_url: ''
# tags: []
---

El objetivo: crear una experiencia donde jugadores formen palabras desde conjuntos aleatorios de 10 letras, validando intentos contra restricciones de la rejilla y una API de diccionario en vivo—reemplazando verificación manual con lógica automatizada.

Diseñé un flujo RESTful: `GamesController` sirve `/new` con rejillas generadas proceduralmente, mientras `/score` procesa intentos con validación triple (cumplimiento de rejilla, verificación de inglés vía API, puntuación).

Innovaciones clave incluyeron sesiones de Rails para puntuación persistente sin bases de datos e integración de Bootstrap para IU responsive.
