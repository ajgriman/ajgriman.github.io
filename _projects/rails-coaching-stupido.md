---
layout: project
lang: es
page_id: rails-stupid-coaching
title: 'Rails Coaching Stupido'
short_description: 'Stupid Coaching convirtió interacciones de Ruby en terminal en una experiencia web dinámica durante mi bootcamp en Le Wagon.'
card_image_path: 'https://ik.imagekit.io/rkdscdtap/projects/rails-stupid-coaching1.png?updatedAt=1748944300179'
image_path: 'https://ik.imagekit.io/rkdscdtap/projects/rails-stupid-coaching2.png?updatedAt=1748944465886'
image_path_alt: &image_path_alt_value 'https://ik.imagekit.io/rkdscdtap/projects/rails-stupid-coaching3.png?updatedAt=1748944758805'
image: *image_path_alt_value
video_url: 'https://ik.imagekit.io/rkdscdtap/projects/rails-stupid-coaching.mp4?updatedAt=1748945047088'
date: 2025-06-03
tech_stack: ['Ruby', 'Ruby On Rails', 'Bootstrap', 'HTML', 'Git']
repo_url: 'https://github.com/ajgriman/rails-stupid-coaching'
live_url: ''
# tags: []
---

El desafío: crear una app de coaching humorística donde usuarios enviaran preguntas y recibieran respuestas directas basadas en algoritmos, reemplazando las limitaciones de CLI con las capacidades full-stack de Rails.

Desarrollé un flujo MVC minimalista en Rails: un formulario con Bootstrap en `/ask` captura preguntas, mientras `/answer` procesa entradas mediante lógica de respuestas (ej: "¡Genial!" por compromiso laboral, réplicas irónicas para preguntas con "?"). Integré pruebas Capybara con Headless Chrome para validación automatizada de UI y plantillas ERB para renderizar preguntas-respuestas.

Usando Ruby on Rails 7+, Bootstrap 5 y Selenium WebDriver, la app logró respuestas en <200ms y 100% de cobertura de pruebas. El proyecto entreno mi dominio de rutas RESTful.
