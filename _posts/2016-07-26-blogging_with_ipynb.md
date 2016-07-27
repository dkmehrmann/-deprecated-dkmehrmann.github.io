---
layout: post
title: "Blogging with IPython Notebooks"
author: "Andrew Mehrmann"
date: "July 26, 2016"
categories: blog
---

I went through a bit of trouble to produce [my last post](/blog/2016/06/20/google_maps.html) which used a Jupyter Notebook to demonstrate the Google Maps API and its corresponding [Python client](https://github.com/googlemaps/google-maps-services-python). I've been interested in using Jupyter Notebooks on this site for quite some time and for some reason never took the time to truly investigate how this might be done. It turns out that some really handy folks have already done the hard parts and I'd like to use this post to document how I got their solution to work for me.  

[This article](http://christop.club/2014/02/21/blogging-with-ipython-and-jekyll/) explains how to perform the conversion from `.ipynb` format to Jekyll-ready format. I started from the [reworked version](https://gist.github.com/tgarc/7d6901858ef708030c19#file-example_usage) by Tomas Garcia, but I really wanted a more streamlined approach that didn't involve manually moving files around or editing the YAML by hand (i.e. adding a title and the date). 

## Scripts

#### [jekyll.tpl](https://github.com/dkmehrmann/dkmehrmann.github.io/blob/master/scripts/jekyll.tpl)

This is a template file for `nbconvert` to use. You may wish to edit the first few lines that contain the header block.

#### [jekyll.py](https://github.com/dkmehrmann/dkmehrmann.github.io/tree/master/_ipynb/jekyll.py)

You'll have to edit lines 18 and 32 to point to your templates and build directories. The templates directory is simple the one that holds `jekyll.tpl`. The build directory is where `nbconvert` will spit out your converted file. This needs to be the same as the build directory in `convert.sh`

#### [convert.sh](https://github.com/dkmehrmann/dkmehrmann.github.io/blob/master/scripts/convert.sh)

I needed to execute a bunch of things in succession so I thought I'd write a Bash script to automate the process. It's my first bash script ever, so it certainly has a lot of room for improvement. I don't enjoy how currently you have to run the script from the directory that contains the notebook you wish to convert. I also don't enjoy how a change in the directory structure of my github repo would break everything. That said, I think I've spent enough time on this and leave further tinkering to the future. To get this to work for you, you'll have to edit the BUILD_DIR and POST_DIR.


## Example

What happens when `convert.sh` is executed? First we call `nbconvert` on the argument (which should be the `.ipynb` file) using the `jekyll.py` config file. This config file also calls the `jekyll.tpl` template from the templates directory specified therein. `nbconvert` deposits the newly created markdown file in the build directory. Most of the heavy lifting is now done, but we still want to add a title and the proper date to both the file name and the YAML. The script will prompt you for the title of your post, which will be inserted as 4th line of the file in the form `title: <your title>`. Prior to that the current date is inserted as the 3rd line of the file. The file will also be named according to the current date so the idea is to run `convert.sh` on the day you want to publish your post. Finally the script checks if the target file in the POST_DIR is older than the file it just created. If so it will overwrite it, but if not it won't to protect you from overwriting newer work.

Say I have a Jupyter Notebook I'd like to publish called `example.ipynb`. I'd put it in my `~/gitrepos/dkmehrmann.github.io/_ipynb` directory, then **from that same directory** call `convert.sh` with `../scripts/convert.sh example.ipynb`. The shell would prompt me for a title and print a success or failure message when it was finished. I keep my notebooks in my build directory to be tidy but you don't have to do it that way. I also need `jekyll.py` to be in the `_ipynb` directory since that's the first place nbconvert will look for the config file. 

***

Please feel free to use the following at your discretion. Credit is listed above to those who did most of the work for the nbconvert stuff and the shell script is entirely mine so I apologize to anyone who gets ahold of it :).


Note: I can't guarantee the gist below will have the most up-to-date versions of the scripts I use. For those versions you can use the links above to access the github repo for this site.

<script src="https://gist.github.com/dkmehrmann/3fd9e8b89a6e442fdc8787a4c1dbf4f2.js"></script>



