---
layout: post
categories: blog
title: "nhlscrapr Intro - Part 1"
author: "Andrew Mehrmann"
date: "July 16, 2016"
---

To use the nhlscrapr package it's helpful to first read the [original blog post](http://www.acthomas.ca/comment/2014/04/nhlscrapr-an-r-package-whose-purpose-is-right-there-in-the-name.html) about the package. 


{% highlight r %}
setwd('~/NHL')
library('nhlscrapr')
games = full.game.database()
names(games)
{% endhighlight %}



{% highlight text %}
##  [1] "season"     "session"    "gamenumber" "gcode"      "status"    
##  [6] "awayteam"   "hometeam"   "awayscore"  "homescore"  "date"      
## [11] "game.start" "game.end"   "periods"
{% endhighlight %}

If you wanted to filter this empty DataFrame by season, you could trim it down using the `season` column. Other options would be slicing by game code (`gcode`) or regular season/playoffs (`session`). 


{% highlight r %}
unique(games$season)
{% endhighlight %}



{% highlight text %}
##  [1] "20022003" "20032004" "20052006" "20062007" "20072008" "20082009"
##  [7] "20092010" "20102011" "20112012" "20122013" "20132014" "20142015"
{% endhighlight %}

It looks like the data available is from 2002-2015.


{% highlight r %}
# get 20 games from the most recent season to test
games2015 = games[games$season == "20142015", ]
games2015 = games2015[1:20,]
{% endhighlight %}

After grabbing the first 20 games of the 2014-2015 season from `games`, we pass this DataFrame to `compile.all.games()` as the argument `new.game.table`. 

Alternatively we could use the `seasons` argument of `compile.all.games()`. As a reference, the arguments of that function are as follows:

```
compile.all.games(rdata.folder="nhlr-data",
                  output.folder="source-data",
                  new.game.table=NULL,
                  seasons=NULL,
                  verbose=FALSE,
                  override.days.back=NULL,
                  date.check=FALSE,
                  ...)
```

Where ```...``` are arguments to be passed to `download.single.game()` which has arguments

```
download.single.game(season="20122013",
                     gcode="20001",
                     rdata.folder="nhlr-data",
                     verbose=TRUE,
                     wait=20)
```


{% highlight r %}
# NOT RUN
ptm <- proc.time()
all.games = compile.all.games(new.game.table=games2015, verbose=F, wait=5)
proc.time() - ptm
{% endhighlight %}

`all.games` is a boolean and I think it indicates if the scrape was successful. Andrew Thomas suggests the it takes roughly 6 seconds per game, and the process above took 10 seconds per game that included a 5 second wait per game so I believe it takes roughly $5+wait$ seconds per game. A whole season would be 1335 games and take about $1335*(5+wait)$ seconds or 3 hours and 45 minutes for a 5 second wait. Since there are 13 seasons, it could take a while to get all the data available.

The above command deposited two directories in my current working directory: 

```
project
│   scrape_games.Rmd
│   scrape_games.R 
│
└───source-data
    │   nhlscrapr-20142015.RData
    │   nhlscrapr-core.RData
    │
    nhlr-data
    │   20142015-20001.RData
    │   20142015-20001-processed.RData
    |   20142015-20002.RData
    |   20142015-20002-processed.RData
    |   ...

```


{% highlight r %}
load("~/NHL/source-data/nhlscrapr-20142015.RData")
{% endhighlight %}

While we're here, why don't we set up the framework for a future analysis. I aim to investigate the hypothesis that the home team wins more faceoffs than the visiting team. The rules of hockey are slightly favorable to the home team during faceoffs, so I want to know whether there is any difference from that rule or not.


{% highlight r %}
# home team wins
nrow(subset(grand.data, etype=='FAC' & ev.team==hometeam))
{% endhighlight %}



{% highlight text %}
## [1] 42126
{% endhighlight %}



{% highlight r %}
# away team wins
nrow(subset(grand.data, etype=='FAC' & ev.team==awayteam))
{% endhighlight %}



{% highlight text %}
## [1] 38956
{% endhighlight %}

I have a lot of trouble finding documentation for this package beyond the R manual. I did however find a really awesome tool called the Scientific Software Network Map Project. If you use it to [search nhlscrapr](http://scisoft-net-map.isri.cmu.edu/application/nhlscrapr/gitprojects), you get every GitHub repository that references the package in the R code.

There are some really awesome projects listed there including [a Shiny App](https://github.com/jersme/HockeyStats/tree/master/shiny/caps%20s1415), [another Shiny App](https://github.com/shinwookang/Shiny-Repository), and [code to draw a hockey rink](https://github.com/dbendet/hockey_analytics/blob/master/rink_drawing.r), among other things.

If you want to get really crazy, you can download the entire corpus of data with the following code:


{% highlight r %}
# NOT RUN
setwd('~/NHL')
library('nhlscrapr')
games = full.game.database()

# get all the data
compile.all.games(new.game.table=games,verbose=F, wait=5)
{% endhighlight %}

When I ran this it took about a day and a half and deposited about 1GB of data on my machine. I also found that if you do something stupid like close your laptop the process will pick up where it left off so long as you operate in the same directory. This tool is really great for pulling down some hard-to-find data that would have previously required web scraping several different sources. In a future post, I'll dive into some analyses of this data using `dplyr` and the `%>%` pipe operator.
