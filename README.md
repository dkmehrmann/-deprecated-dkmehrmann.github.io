# dkmehrmann.github.io
Personal Webpage. Much of the code for creating the layout was borrowed heavily from Hadley Wickham's [Advanced R](http://adv-r.had.co.nz/) and [R Packages](http://r-pkgs.had.co.nz/) sites.

## Creating Posts

#### Standard Markdown Blog Post

YAML:

```
---
layout: post
title: "Blogging with IPython Notebooks"
author: "Andrew Mehrmann"
date: "June 9, 2016"
categories: blog
---

```

#### Ideas Journal

YAML: 

```
---
layout: post
title: "nhlscrapr"
author: "Andrew Mehrmann"
date: "May 3, 2016"
section: Data Science
categories: ideas
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
category: blog
---
```

then run `scripts/knit_script.R` and change the resulting filename in `_posts` (automate in the future).

