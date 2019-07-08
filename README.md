# dkmehrmann.github.io

Personal Webpage and data science blog. Much of the code for creating the original layout was borrowed heavily from Hadley Wickham's [Advanced R](http://adv-r.had.co.nz/) and [R Packages](http://r-pkgs.had.co.nz/) sites. I have since made some changes to where I think the sites are quite different, but I want to give credit where it's due.

Note to self: running a GitHub Pages site requires running a local version for development, and the best way to do this is Docker IMHO. For me, the command is

```
docker run --rm   -v ~/gitrepos/dkmehrmann.github.io:/srv/jekyll -p 4000:4000   -it jekyll/minimal jekyll serve
```

so i don't lose it again.

## Creating Posts

#### Standard Markdown Blog Post

YAML:

```
---
layout: post
title: "Blogging with IPython Notebooks"
author: "Andrew Mehrmann"
date: "June 9, 2016"
categories: ds programming
---

```

#### Blogging with Jupyter Notebooks

Put the notebook in the `_ipynb` directory and run the script `scripts/convert.sh` from that directory. That's it :).

#### Blogging with R Markdown

Set YAML like so within Rmd document:

```
---
layout: post
title: "The Secretary Problem"
author: "Andrew Mehrmann"
date: "August 3, 2016"
output: html_document
categories: ds programming
---
```

then run `scripts/knit_script.R` and change the resulting filename in `_posts` (automate in the future).
