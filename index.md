---
layout: default
---

# Hello!

My name is Andrew Mehrmann and I'm a data scientist living in Chicago. In my professional life I sit at the intersection of Data Science and engineering, creating tools and services to bridge the gap between data science and the "real world". These may include platforms for machine learning deployment, interactive applications for exploring data, or web services for delivering insights to customers. My mission is to enable data scientists do great work and see that work through to fruition. You can read more about me [here](/about).

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
