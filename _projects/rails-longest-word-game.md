---
layout: project
lang: en
page_id: rails-longest-word-game
title: "Rails Longest Word Game"
short_description: "This Rails-based word game transforms static letter grids into dynamic interactions. Built during my Le Wagon bootcamp."
card_image_path: "https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word-game1.png?updatedAt=1748955639638"
image_path: "https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word2.png?updatedAt=1748956151228"
image_path_alt: "https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word3.png?updatedAt=1748956113489"
video_url: "https://ik.imagekit.io/rkdscdtap/projects/rails-longest-word-game.mp4?updatedAt=1748955223374"
date: 2025-06-03
tech_stack: ["Ruby", "Ruby On Rails", "Bootstrap", "HTML", "Git"]
repo_url: "https://github.com/ajgriman/rails-longest-word-game"
live_url: ""
# tags: []
---

The objective? Create an engaging experience where players form words from randomized 10-letter sets, validating submissions against grid constraints and a live dictionary API—replacing manual verification with automated logic.  

I architected a RESTful flow: the `GamesController` serves `/new` with procedurally generated letter grids, while `/score` processes submissions through triple-layer validation (grid compliance, English verification via API, scoring).

Key innovations included Rails sessions for persistent score tracking without databases and Bootstrap integration for responsive card-based UI.  
