#!/bin/bash

# Create context file with timestamp
echo "Jekyll Project Context Report" > project_context.txt
echo "Generated at: $(date)" >> project_context.txt
echo -e "\n====================================\n" >> project_context.txt

# 1. Directory structure
echo "===== DIRECTORY STRUCTURE =====" >> project_context.txt
echo "Top-level directories:" >> project_context.txt
ls -d */ >> project_context.txt
echo -e "\n_layouts content:" >> project_context.txt
ls -l _layouts/ >> project_context.txt
echo -e "\n_data content:" >> project_context.txt
ls -l _data/ >> project_context.txt
echo -e "\nIncludes content:" >> project_context.txt
ls -l _includes/ 2>/dev/null || echo "No _includes directory" >> project_context.txt
echo -e "\nPages content:" >> project_context.txt
ls -l _pages/ 2>/dev/null || echo "No _pages directory" >> project_context.txt
echo -e "\n====================================\n" >> project_context.txt

# 2. Config files
echo "===== _CONFIG.YML =====" >> project_context.txt
if [ -f "_config.yml" ]; then
    head -30 _config.yml >> project_context.txt
else
    echo "_config.yml not found!" >> project_context.txt
fi
echo -e "\n====================================\n" >> project_context.txt

# 3. Layout files
echo "===== LAYOUT FILES =====" >> project_context.txt

# Default layout
echo "\n--- DEFAULT.HTML ---" >> project_context.txt
if [ -f "_layouts/default.html" ]; then
    head -40 _layouts/default.html >> project_context.txt
else
    echo "default.html not found!" >> project_context.txt
fi

# About layout
echo "\n--- ABOUT.HTML ---" >> project_context.txt
if [ -f "_layouts/about.html" ]; then
    head -40 _layouts/about.html >> project_context.txt
else
    echo "about.html not found!" >> project_context.txt
fi
echo -e "\n====================================\n" >> project_context.txt

# 4. About pages
echo "===== ABOUT PAGES =====" >> project_context.txt

# English about page
echo "\n--- about.markdown ---" >> project_context.txt
if [ -f "about.markdown" ]; then
    cat about.markdown >> project_context.txt
elif [ -f "_pages/about.markdown" ]; then
    cat _pages/about.markdown >> project_context.txt
else
    echo "about.markdown not found!" >> project_context.txt
fi

# Spanish about page
echo "\n--- about_es.markdown ---" >> project_context.txt
if [ -f "about_es.markdown" ]; then
    cat about_es.markdown >> project_context.txt
elif [ -f "_pages/about_es.markdown" ]; then
    cat _pages/about_es.markdown >> project_context.txt
else
    echo "about_es.markdown not found!" >> project_context.txt
fi
echo -e "\n====================================\n" >> project_context.txt

# 5. Localization files
echo "===== LOCALIZATION FILES =====" >> project_context.txt

# English locale
echo "\n--- locales/en.yml ---" >> project_context.txt
if [ -f "_data/locales/en.yml" ]; then
    cat _data/locales/en.yml >> project_context.txt
else
    echo "en.yml not found!" >> project_context.txt
fi

# Spanish locale
echo "\n--- locales/es.yml ---" >> project_context.txt
if [ -f "_data/locales/es.yml" ]; then
    cat _data/locales/es.yml >> project_context.txt
else
    echo "es.yml not found!" >> project_context.txt
fi

echo -e "\n\n===== CONTEXT COLLECTION COMPLETE =====" >> project_context.txt