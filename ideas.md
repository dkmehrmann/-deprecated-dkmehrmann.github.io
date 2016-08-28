---
layout: page
title: Ideas Journal 
---


<ul style="padding-left:0;">
  {% for post in site.categories.ideas %}
    
      <h2>
        <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
      </h2>

      <span class="text-success">{{ post.section }}</span>

    <p>{{ post.content }}</p>
  
  {% endfor %}
</ul>