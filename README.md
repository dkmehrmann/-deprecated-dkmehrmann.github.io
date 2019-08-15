# dkmehrmann.github.io

Running a GitHub Pages site is a lot easier if you run a local version for development, and the best way to do this is Docker IMHO. For me, the command is

```
docker run --rm   -v ~/gitrepos/dkmehrmann.github.io:/srv/jekyll -p 4000:4000   -it jekyll/minimal jekyll serve
```

so i don't lose it again.

The site is organized by "tags" and currently there are two: `election` and `technical`. Creating a new tag is as simple as putting a `.md` file with the tag name in the root directory with the following YAML:

```
---
layout: category
title: <title for tag page>
navigable: true
mytag: <tag name>
---
```

The reason for tags over categories is that tags don't show up in the URL but categories do, so if you want to reorganize the tags on the site, or change a post's tag, you'll break any existing links to it from external sources.

## Creating Posts

#### Standard Markdown Blog Post

YAML:

```
---
layout: post
title: "Blogging with IPython Notebooks"
author: "Andrew Mehrmann"
date: "June 9, 2016"
tags: ds programming
---

```

#### Warning: The following may be deprecated since switching from Categories to Tags. I haven't tested this in quite some time.

#### Blogging with Jupyter Notebooks

Put the notebook in the `_ipynb` directory and run the script `scripts/convert.sh` from that directory.

#### Blogging with R Markdown

Set YAML like so within Rmd document:

```
---
layout: post
title: "The Secretary Problem"
author: "Andrew Mehrmann"
date: "August 3, 2016"
output: html_document
tags: ds programming
---
```

then run `scripts/knit_script.R` and change the resulting filename in `_posts` (automate in the future).
