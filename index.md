---
layout: default
title: Home
navigable: false
---

# Latest

<ul class="well">
  {% for post in site.posts limit:3 %}

      <h2>
        <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
      </h2>

      <span class="text-warning">{{ post.date | date: "%b %-d, %Y" }}</span>

      <p>{{ post.content | strip_html | truncatewords:75}}</p>

      <a href="{{ post.url | prepend: site.baseurl }}">Read more...</a><br>

  {% endfor %}
</ul>
