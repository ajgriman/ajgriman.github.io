---
layout: default
lang: es
page_id: homepage
title: 'Projectos'
permalink: /
---

{%- assign t = site.data.locales[site.active_lang] -%}

<div class="container-fluid py-4">
    <div class="row gx-4" id="project-grid"> 
      {%- assign projects_to_display = site.projects | where: "lang", "es" -%}

      {%- if projects_to_display.size == 0 and site.active_lang != site.default_lang -%}

        {%- assign projects_to_display = site.projects | where: "lang", site.default_lang -%}
        {%- if projects_to_display.size > 0 -%}
          <div class="col-12"><p class="text-center text-muted small">({{ t.showing_default_lang_projects | default: "Showing projects in default language as no specific translations were found for this section." }})</p></div>
        {%- endif -%}
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
