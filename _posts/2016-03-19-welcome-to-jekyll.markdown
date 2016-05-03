---
layout: post
title:  "Hello World!"
date:   2016-03-19 16:57:20 -0500
categories: blog
author: Andrew Mehrmann
---

Welcome to my blog! With my first post I would like to share a few things I've learned through creating this webpage and [another](ui-datascience.github.io) with GitHub Pages and Jekyll. I've learned a lot through this process and I'm always impressed with how much information is available through StackExchange and similar sites when learning a new skill. I was, however, kinda bummed by the lack of tutorial-type information about customizing a Jekyll/GitHub site. There are lots of tutorials for getting started (below), and the [Jekyll Docs](https://jekyllrb.com/docs/home/) are extremely thorough, but middle ground (i.e. how do I change the background color?) was a little difficult to find.

This post will be a sort of intermediate intro to Jekyll that assumes a working knowledge of HTML and CSS. **Specifically, this post will roughly outline how to change the default Jekyll site to use a bootstrap CSS theme from Bootswatch.com.** For introductory tutorials, see Getting Started below.



## Getting Started

There are a <b>ton</b> of tutorials for getting up and running with Jekyll and Github pages. Here are a couple good ones:

* [GitHub Documentation](https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/)
* [Anna Debenham's Tutorial](https://24ways.org/2013/get-started-with-github-pages/)

<p><b>TIP:</b> My version of Jekyll doesn't require me to do specify any special command line arguments to get the engine to "watch" for changes. This means every time I make a change I can simply refresh my browser to see the changes <b>except</b> if I change the _config.yml file.</p>

I won't go into the details, but I highly recommend taking the common advice of installing Jekyll locally. If you're anything like me, you'll be testing so often it will be absolutely impossible to push all your changes to GitHub each time you want your page rendered. Another complication is that the changes you push to GitHub will take a while to appear at the URL of your site. As an example, posts can sometimes take upwards of 15 minutes to appear. By installing locally you'll be able to serve your site at http://localhost:4000 (by default) and see the effects of your changes immediately. 




## The Index Page

If you create a new Jekyll site via 
{% highlight bash %}
jekyll new
{% endhighlight %}
you'll have a file called index.html. This will be the first page people see when they visit your site. Don't change the name of this file, as it is standard practice in most web frameworks to look first for an "index" page. This page will look like this:

{% raw %}
```
	---
	layout: default
	---

	<div class="home">

	  <h1 class="page-heading">Posts</h1>

	  <ul class="post-list">
	    {% for post in site.posts %}
	      <li>
	        <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>

	        <h2>
	          <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
	        </h2>
	      </li>
	    {% endfor %}
	  </ul>

	  <p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

	</div>
```
{% endraw %}

This page simply uses a default layout (we'll talk about that in the next section) to display all the site's blog posts along with an option to subscribe via RSS.


## Layouts

The top section of any page contains some metadata about that page. For the index page, this chunk

{% highlight html %}
---
layout: default
---
{% endhighlight %}

tells the Jekyll engine which layout to use. Layouts are located in _layouts, and if we take a look at default.html we see


{% raw %}
```
	<!DOCTYPE html>
	<html>

	  {% include head.html %}

	  <body>

	    {% include header.html %}

	    <div class="page-content">
	      <div class="wrapper">
	        {{ content }}
	      </div>
	    </div>

	    {% include footer.html %}

	  </body>

	</html>
```
{% endraw %}

As you can see, we started by looking at index.html, then went to the layout in default.html, and see even more references to other files! This is where customizing a Jekyll page starts to become a headache <b>BUT</b> once you get used to this strucutre, having things in separate files like this makes it extremely easy to make a site-wide change. The files head.html, header.html, and footer.html are in the _includes directory. This directory is a good place to hold little bits of HTML that reoccur on multiple pages.

Any page that uses the "default" layout will have the same structure. You can change default.html to change the struture of all of these pages at once. Personally, I use a modified version of this layout for all pages on my site except for full blog posts, for which I use a modified version of post.html.

Back to the layout file, this structure is pretty standard. First it includes head.html which will hold metadata about the page including which style sheet to use. Then it adds the default header, which has a title and a navbar. {{content}} is where the contents of the page that is calling the layout will go. In the Index example, the contents of index.html go there. Then it includes a footer. 

If you want to customize this layout, you have the option of adding style elements to the CSS tags or changing the html files it calls. To make a custom header, for example, you'd alter or create a new header.html file. Before you make any changes, though, please read on. It is important to understand the underlying file structure of this site BEFORE making changes. 




## CSS

When I created my first site, I tried to work with the default theme as much as possible. Since I didn't know anything about CSS, I was hesitant to drastically alter the appearance of the site. With this site, however, the FIRST thing I did was pick out a CSS theme I wanted to use. That made the rest of the work a whole lot easier because I knew exactly which tags to use to get the look and feel I wanted.

I'm a HUGE fan of [bootswatch](https://bootswatch.com/) for designing simple sites. If you choose to go this route, note that there are quite a few themes to choose from and all of the tags from one theme will work in another, so switching between themes is as simple as changing which bootstrap.css file your site calls. Once you've picked out a theme (remember, you can always change this), download the bootstrap.css file into the css directory of your site. Then go into _includes/head.html and find this line:

{% highlight html %}
  <link rel="stylesheet" href="{{ "/css/main.css" | prepend: site.baseurl }}">
{% endhighlight %}

and change main.css to the name of the sheet you just downloaded. When you refresh the site, you might panic because everything is now garbled and looks terrible. This happened because the tags in your html files now don't match the tags in the style sheet you're using. 

Now your work is cut out for you. You'll need to go through every tag in every html file and see what it was originally doing, what you want it to do, and how to get it to do that with your new bootstrap file. Since your site only has one page right now, the files you'd need to sift through are 

* _includes/header.html
* _includes/footer.html
* index.html

and if you want to keep the github and twitter icons, you'll have to go through those files in _includes as well. Feel free to check out my code for examples. I use bootswatch so if you choose that route, the tags will match up. One reason I really like bootswatch is the ability to see demonstrations and get the html source in a convenient format. If you find something you'd like to add to your site, simply click on the icon in the top right corner of that item and you'll see the proper css tag and html format to use. 

**NOTE:** If you see something from the base theme that you just can't live without, you can include it in your bootstrap.css file. You won't want to simply paste it in though, as that will make swapping themes more difficult. Make a new text file called helper.css (or whatever you want) with the css code from the base css file. Then make the first line of your bootstrap.css file 

{% highlight css %}
@import url("helper.css");
{% endhighlight %}

This way you'll only have to add one line to any bootswatch theme you choose. Once you have a working version of your home or index page, making new pages will be extremely easy. At this point you may also with to change the default layout. One example would be adding a sidebar. 




## Making New Pages

One remarkable thing about Jekyll is that you can write new pages in either Markdown or HTML. If your page is simple enough, you can simply use Markdown to construct it and the layout you choose will still apply. If fact, you can use HTML inside a markdown document! Check out the default about.md file for an example of a page written in markdown.

When making a new page, the first thing you should do is specify the title and layout along with any other metadata you'd like to include. This must be done for both HTML and markdown pages and it's done the same way for both. For example, my about.md file starts with:

{% highlight html %}
---
layout: page
title: About
permalink: /about/
---
{% endhighlight %}

You don't have to specify a title, but any code that calls page.title will not work correctly if you don't specify a title. For example, my navbar is generated automatically based on the pages in the site as follows: 

{%raw%}

```
  <ul class="nav navbar-nav">
    {% for my_page in site.pages %}
      {% if my_page.title %}
      <li><a class="page-link" href="{{ my_page.url | prepend: site.baseurl }}">{{ my_page.title }}</a></li>
      {% endif %}
    {% endfor %}
  </ul>
```

{% endraw %}

so if a page doesn't have a title, it won't show up in the navbar!


## Writing a Post

Make your posts in the _posts directory. It must be named by the convention YYYY_MM_DD-name.md. Posts also have a metadata block associated with them that may look like this:

{% highlight html %}
---
layout: post
title:  "Hello World!"
date:   2016-03-19 16:57:20 -0500
categories: jekyll
author: Andrew Mehrmann
---
{%endhighlight%}

Notice in this example that the layout is now "post" instead of default. That's because posts have special relevant metadata and you may wish to display them differently than normal pages on your site. For example, you may with to display the author and creation date along with the content. It is important to get the date in the correct format because posts are organized by date and time of creation as specified in the metadata. Categories may be important if you with to display certain posts together or separate from each other. You can display one group of posts on one page (say, with category "R") and one group of posts on another (say, with category "Python"). We'll get into that in the following section, so don't worry too much about it now. 


## Tricks for Displaying Posts

#### Truncating 

If you want to show just the first few words of your posts with a "Read More..." option, consider the following snippet:

{%raw%}
```
  <ul class="well">
    {% for post in site.posts%}

        <h2>
          <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        </h2>

        <span class="text-warning">{{ post.date | date: "%b %-d, %Y" }}</span>

        <p>{{ post.content | strip_html | truncatewords:75}}</p>
        
        <a href="{{ post.url | prepend: site.baseurl }}">Read more...</a><br>

    {% endfor %}
  </ul>
```
{%endraw%}

  which will display all posts with 75 words of the content and then a link to the full text.

#### Limiting

  If you want to display just the most recent 3 you can use the limit option:

{%raw%}
```
  {% for post in site.posts limit:3 %}
```
{%endraw%}

#### Categories

If you want to display only posts with the category R, you can use:

{%raw%}
```
{% for post in site.categories.R %}
```
{%endraw%}



## Conclusion

Creating a site with Jekyll can be extremely easy, but it can also be as difficult as you want it to be. In my opinion it is kind of a "Goldilocks" platform that isn't too simple that every site looks the same, but not too complicated that you're building the platform from the ground up. I highly recommend using a bootswatch theme for the most bang for your buck. You can always write your own CSS file, but that would require quite a bit of web experience that most people using Jekyll won't have. If you go the bootswatch route, please feel free to "borrow" some of my code. I think it not only simplifies site customization but also simplifies the code quite a bit. Plus, the act of going through all the default code and changing tags will vastly improve your understanding of your site. Happy Blogging!