---
layout: post
title: "Blogging with IPython Notebooks"
author: "Andrew Mehrmann"
date: "June 21, 2016"
categories: blog
---

## Converting to Jekyll Format

I went through a bit of trouble to produce [my last post](/blog/2016/06/20/google_maps.html) which used a Jupyter Notebook to demonstrate the Google Maps API and its corresponding [Python client](https://github.com/googlemaps/google-maps-services-python). I've been interested in using Jupyter Notebooks on this site for quite some time and for some reason never took the time to truly investigate how this might be done. It turns out that some really handy folks have already done the hard parts and I'd like to use this post to document how I got their solution to work for me.  

[This article](http://christop.club/2014/02/21/blogging-with-ipython-and-jekyll/) explains how to perform the conversion from `.ipynb` format to Jekyll-ready format. I started from the [reworked version](https://gist.github.com/tgarc/7d6901858ef708030c19#file-example_usage) by Tomas Garcia, but I really wanted a more streamlined approach that didn't involve manually moving files around or editing the YAML by hand (i.e. adding a title and the date). 

## My First Bash Script

I needed to execute a bunch of things in succession so I thought I'd write a Bash script to automate the process. 

I need to to the following things:

1. Convert the .ipynb file to a .md file
2. Change the Title of the post
3. Add a date in the YAML
4. Change the name of the file
5. Move the file to my _posts directory

I know I can get the date in various formats with BASH by using `now="$(date +'%d/%m/%Y')"`

<script src="https://gist.github.com/dkmehrmann/3fd9e8b89a6e442fdc8787a4c1dbf4f2.js"></script>


