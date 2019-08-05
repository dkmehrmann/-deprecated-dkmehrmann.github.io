---
layout: homepage
title: Home
navigable: false
---

<div class='row'>
<div class='col-xs-12 col-sm-9'>

<div class='well'>

<h2>Latest</h2>

<hr style='border-color:#8e8d8d;'>

<ul style="padding-left:0px;">
  {% for post in site.posts limit:3 %}

      <h2>
        <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
      </h2>

      <span class="text-warning">{{ post.date | date: "%b %-d, %Y" }}</span>

      <br>

      {% for category in post.categories %}
        <a href="/{{category}}" class="btn btn-warning btn-xs" style='margin-top:8px; margin-bottom:8px;'>{{category}}</a>
      {% endfor %}

      <p>{{ post.content | strip_html | truncatewords:75}}</p>

      <a href="{{ post.url | prepend: site.baseurl }}">Read more...</a><br>

  {% endfor %}
</ul>
</div>
</div>
<div class='col-xs-12 col-sm-3 pull-right'>
<h2>Social</h2>
<hr>
<div class="socialBox">

      {% include icon-github.html username=site.github_username %}


      {% include icon-email.html username=site.email %}


      {% include icon-linkedin.html %}

      {% include icon-twitter.html %}

</div>

<br>
<a class="twitter-timeline" data-theme="dark" data-height="900" href="https://twitter.com/andrewmehrmann?ref_src=twsrc%5Etfw">Tweets by andrewmehrmann</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</div>
