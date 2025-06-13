---
layout: default
lang: en
page_id: homepage
image: 'img/imageexample.png'
title: 'Projects'
# permalink: /
---

{%- assign t = site.data.locales[site.active_lang] -%}

<div class="container-fluid py-4">
    <!-- <h1 class="mb-4 text-center">{{ t.homepage_title | default: "My Projects" }}</h1> -->

    <div class="row gx-4" id="project-grid">
      {%- comment -%}
        Loop through projects for the current active language.
        Polyglot makes 'site.projects' only contain projects for the active language
        if the projects themselves have a 'lang' attribute.
      {%- endcomment -%}
      {%- assign projects_to_display = site.projects | where: "lang", site.active_lang -%}

      {%- if projects_to_display.size == 0 and site.active_lang != site.default_lang -%}
        {%- comment -%} If no projects for the current non-default lang, try showing default lang projects {%- endcomment -%}
        {%- assign projects_to_display = site.projects | where: "lang", site.default_lang -%}
      {%- endif -%}

      {% for project_item in projects_to_display %}
        <div class="col-12 col-md-6 col-lg-4 project-grid-item mb-4">
          {% include project_card.html project=project_item %}
        </div>
      {% else %}
        <div class="col-12">
          <p class="text-center">{{ t.no_projects_yet | default: "No projects to display yet." }}</p>
        </div>
      {% endfor %}
    </div>

</div>
