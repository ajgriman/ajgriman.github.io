---
layout: project
lang: en
page_id: rails-watch-lists
title: "Rails Watch Lists"
short_description: "Movie curation platform featuring CRUD list management, Tom Select movie search, bookmark comments, and star-rating.js reviews. Enhanced UX with Typed.js animations, AOS.js scroll reveals, and Bootstrap 5 responsive cards. Built at Le Wagon bootcamp."
card_image_path: "https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list1.gif?updatedAt=1749384953788"
image_path: "https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list2.png?updatedAt=1749384855468"
image_path_alt: "https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list3.png?updatedAt=1749384880152"
image: "https://ik.imagekit.io/rkdscdtap/projects/rails-watch-list3.png?updatedAt=1749384880152"
video_url: "https://youtu.be/A84wPcYgAK8"
date: 2025-06-08
tech_stack: ["Ruby On Rails", "Ruby", "JavaScript", "Bootstrap", "PostgreSQL"]
repo_url: "https://github.com/ajgriman/rails-watch-list"
live_url: ""
# tags: []
---

Built a full-featured movie watchlist app enabling users to create/manage lists, bookmark films with personalized comments, and review collections. Key features include:  
- Dynamic Lists: CRUD operations with image URLs (validated) and responsive card displays  
- Smart Bookmarking: Tom Select-powered searchable dropdowns for movie selection with comment validation (6+ chars)  
- Review Ecosystem: Star-rating.js integration for 1-5 ratings + text reviews displayed via custom SVG helpers  

Mastered Rails 7's JavaScript integration hurdles:  
- Importmap Challenges: Diagnosed UMD/IIFE vs. ES module conflicts in AOS.js/Star-Rating.js  
- Vendor Solutions: Modified library source (e.g., `this`→`window` bindings) to enable local ES module loading  
- Turbo Optimization: Initialized libraries on `turbo:load` with timeout fallbacks for DOM stability  
- Testing Rigor: Configured RSpec submodule for model validations (uniqueness, FK constraints) and movie deletion guards  

Delivered polished UX through:  
- Animated UI: Typed.js titles + AOS.js scroll-triggered card reveals  
- Bootstrap 5 + Custom SCSS: Responsive banners with image fallbacks  
- Database Integrity: PostgreSQL-backed movie seeding with `dependent: :restrict_with_error` safeguards  
- Debugging Wins: Resolved asset pathing (SVGs), CSS conflicts, and initialization race conditions  
