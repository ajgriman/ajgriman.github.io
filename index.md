---
layout: default
lang: en
page_id: homepage
image: 'https://ik.imagekit.io/rkdscdtap/griman-devworks-en.png?updatedAt=1749826326105'
title: 'Projects'
# permalink: /
---

{%- assign t = site.data.locales[site.active_lang] -%}

<div class="container-fluid py-4">

  <div class="row gx-4" id="project-grid">
    {%- assign projects_to_display = site.projects | where: "lang", site.active_lang | sort: "date" | reverse -%}

    {%- if projects_to_display.size == 0 and site.active_lang != site.default_lang -%}
    {%- assign projects_to_display = site.projects | where: "lang", site.default_lang | sort: "date" | reverse -%}
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