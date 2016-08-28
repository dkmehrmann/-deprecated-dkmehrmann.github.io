---
layout: default
---

# Hello!

Welcome my homepage! I'm a Master's Student in Statistics at the University of Illinois and aspiring Statistician/Data Scientist. You can read more about me [here](/about).

# Recent Posts

<ul class="well">
  {% for post in site.categories.blog limit:1 %}

      <h2>
        <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
      </h2>

      <span class="text-warning">{{ post.date | date: "%b %-d, %Y" }}</span>

      <p>{{ post.content | strip_html | truncatewords:75}}</p>
      
      <a href="{{ post.url | prepend: site.baseurl }}">Read more...</a><br>

  {% endfor %}
</ul>


