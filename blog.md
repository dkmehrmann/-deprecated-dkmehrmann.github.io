---
layout: default
title: Blog
navigable: true
---


# Posts


<ul class="nav nav-tabs">

  <li class="nav active"><a data-toggle="tab" href="#election">Election 2020</a></li>

  <li class="nav"><a data-toggle="tab" href="#ds">Data Science</a></li>

  <li class="nav"><a data-toggle="tab" href="#programming">Programming</a></li>
</ul>

<div class="tab-content">

  <div class="tab-pane fade in active" id="election">
        <ul style="padding-left:0px;">
      {% for post in site.categories.election %}

          <h2>
            <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </h2>

          <span class="text-warning">{{ post.date | date: "%b %-d, %Y" }}</span>
          <p>{{ post.content | strip_html | truncatewords:75}}</p>
          <a href="{{ post.url | prepend: site.baseurl }}">Read more...</a><br>

      {% endfor %}
    </ul>
  </div>

  <div class="tab-pane fade" id="ds">
        <ul style="padding-left:0px;">
      {% for post in site.categories.ds %}

          <h2>
            <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </h2>

          <span class="text-warning">{{ post.date | date: "%b %-d, %Y" }}</span>
          <p>{{ post.content | strip_html | truncatewords:75}}</p>
          <a href="{{ post.url | prepend: site.baseurl }}">Read more...</a><br>

      {% endfor %}
    </ul>
  </div>

  <div class="tab-pane fade" id="programming">
            <ul style="padding-left:0px;">
      {% for post in site.categories.programming %}

          <h2>
            <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </h2>

          <span class="text-warning">{{ post.date | date: "%b %-d, %Y" }}</span>
          <p>{{ post.content | strip_html | truncatewords:75}}</p>
          <a href="{{ post.url | prepend: site.baseurl }}">Read more...</a><br>

      {% endfor %}
    </ul>
  </div>

</div>
