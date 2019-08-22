---
layout: post
title: "Dimple: Javascript for Data Scientists"
author: "Andrew Mehrmann"
date: "August 20, 2019"
output: html_document
tags: technical
---
<br>
<div id="chartContainer"></div>
<br>

*This plot shows how each of the democratic candidates are spending their time in the 4 early primary/caucus states. Keep reading to find out how and why I made it, or [read more here](https://fivethirtyeight.com/features/where-are-candidates-spending-all-their-time/) to get the backstory from FiveThirtyEight.*


<hr>

## Why You Need Javascript

The work of a data scientist is essentially useless if nobody ever sees it. Sometimes that work is necessarily hard to communicate, like when the product is something abstract like a predictive model or recommender system. Nevertheless we almost always have some plots or graphics to show, and graphics are almost always more useful if they aren't condemned to death in PowerPoint slides.

Data scientists can reap huge benefits from learning a little front-end programming like HTML and especially Javascript to create beautiful, interactive, and portable graphics. Because there are so many differing and more qualified opinions on the first of those features, I want to concentrate on the second two: **interactivity** and **portability.**

Data is infinitely more fun and captivating when you can interact with it. Most data consumers, however, don't have the expertise, time, or patience to analyze data themselves. This is where something like an interactive graphic can be extremely useful. From relatively simple features like [tooltips](http://bl.ocks.org/d3noob/a22c42db65eb00d4e369) to more complex applications like this absolutely stunning [introduction to machine learning](http://www.r2d3.us/visual-intro-to-machine-learning-part-1/), or this [visual essay on money in Congress](http://letsfreecongress.org/), interactivity holds our attention for longer than lines or bars on a page. With more sustained attention will come more understanding, which is what we strive for when we communicate our sometimes not-so-intuitive results.

The problem with creating interactive graphics however is that data science languages like Python and R produce *static* plots, or more literally fixed images. Sure, you could create a Flask or Shiny application to host your Python or R code that processes inputs and produces outputs, but the consumer of that application would either need to run the Python or R code or you will have to host it somewhere. Neither option is very tractable in most settings, meaning that these solutions are not very *portable.*

This is where Javascript can really help a data scientist to make portable, interactive graphics. Javascript runs in a web browser, which everybody everywhere has if they have access to a computer. You can usually host a web page more easily than you can host Python or R applications, but you don't even need to because you can simply package your code into an HTML file which any web browser will know how to interpret. Instead of throwing some PNGs in a PowerPoint and giving a lecture, how much more would your audience get out of an interactive webpage that they can play with themselves?

## Why You Hate Javascript

Nevertheless, if you look at most data scientists' resumes you don't see a whole lot of folks with experience in JS. The reason for that is relatively simple: Javascript is hard. Programming in general is hard, but luckily data scientists sort of get away with a cheap one because Python is forgiving and verbose and R is literally made for data science. No such luck with Javascript, which can be especially difficult if one does not have a basic understanding of web concepts like HTML and CSS.

A less pessimistic reason is that Javascript will really only help you with a very specific task: making interactive and portable graphics. It doesn't really make that much sense to put a lot of time and effort into learning a whole new language just to do one thing. The data science community clearly recognizes this, because tools like [Bokeh](https://bokeh.pydata.org/en/latest/) and [htmlwidgets](https://www.htmlwidgets.org/) exist to help you *not* have to learn Javascript.

## Dimple Doesn't Suck (as bad)

Working in Bokeh or htmlwidgets might work great for most cases, but some of you might want to go even further in your ability to customize your Javascript graphics. To me, [Dimple.js](http://dimplejs.org/) sort of hits the sweet spot in terms of being able to quickly turn out graphics that are portable and interactive, but customizable enough for the vast majority of use cases. It's built on top of D3, so I think of it as sort of an entry point into the wide world of D3 data visualization.

What's more is that by producing your graphics in Javascript (as opposed to something like Bokeh), they become totally disjointed from the actual analysis code, meaning that they can be used in conjunction with Python, R, Excel, Stata, SPSS, SAS, or whatever your organization (or yourself) happens to be using at the time.

## A Simple Example

I saw an [article in FiveThirtyEight](https://fivethirtyeight.com/features/where-are-candidates-spending-all-their-time/) that analyzed how much time each democratic presidential candidate spent in each of the 4 "early states" (IA, NH, NV, SC). There were 4 graphics produced in the article, one for each state, that showed what percentage of each candidate's campaign time was spent in that state.

I wanted to combine these graphics into a single bubble-chart format to allow for better comparison across states, and I wanted my graphic to be portable and interactive, so I used Dimple's simple API to produce the graphic at the top of this article.

I [scraped the data into a CSV file using Python](https://colab.research.google.com/drive/1c3A8Zv98SD94QyEF-mwQ7EPzVzGCaSjo), then used an [existing bubble chart example](http://dimplejs.org/examples_viewer.html?id=bubbles_matrix) from the Dimple documentation.

The [data](/data/candidateshares.csv) looks like this:

```
Candidate,         Share, State
Joe Sestak,        0.44,  IA
Steve Bullock,     0.18,  IA
Beto O’Rourke,     0.17,  IA
Tim Ryan,          0.13,  IA
John Hickenlooper, 0.13,  IA
```

The actual HTML and JS code looks relatively straightforward:

{% highlight html %}

<div id="chartContainer"></div>

<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dimple/2.3.0/dimple.latest.min.js"></script>

<script type="text/javascript">
d3.select('#chartContainer')
  .append("h3")
  .text("Where Candidates Spend Their Time")
  .style('margin-left', '50px');
d3.select('#chartContainer')
  .append("p")
  .text("Share of Time Spent Campaigning in the Early States Through July 31")
  .style('margin-left', '50px');

  var myChart;
  var svg = dimple.newSvg("#chartContainer", "100%", 450);
  d3.csv("/data/candidateshares.csv", function (data) {
    myChart = new dimple.chart(svg, data);
    myChart.setMargins("50px", "0px", "0px", "120px");
    myChart.addCategoryAxis("x", "Candidate");
    myChart.addCategoryAxis("y", "State");
    var z = myChart.addPctAxis("z", "Share");
    var s = myChart.addSeries("Candidate", dimple.plot.bubble);
    myChart.draw();
  });
  window.onresize = function () {
    myChart.draw(0, true);
};
</script>

{% endhighlight %}

I added a couple features like the plot resizing with the browser window (so it looks OK on mobile), and a title and subtitle. Both of these code snippets were lifted from examples I found easily on the web.

Notice how the syntax looks sort of familiar to any other object-oriented plotting tool, like Matplotlib. Indeed, this relatively easy-to-use API is what sets tools like Dimple apart from raw D3 (which Dimple is built on top of).

All told, this took me about an hour (most of that hour was spent "remembering" a very specific nuance of the Pandas API), and instead of a static PNG I have a publication-ready, interactive, fully-portable SVG embedded in a webpage. The process for me looked something like this:

1. Get data into a format that Dimple can use. All the Dimple examples I could find expect long data, while Matplotlib works well with either long or wide data (See [here](http://jonathansoma.com/tutorials/d3/wide-vs-long-data/) for a quick overview of the difference if you're unfamiliar)
2. Copy a Dimple template that looks close to what I want to produce, and point it at the data
3. Use a little Javascript sleuthing/hacking to add features I want, like automatic resizing and a title

It's not much to look at, but I hope it demonstrates the possibilities that working in Javascript can bring to data scientists at relatively little cost.

## Conclusion

While Javascript can be difficult to learn, higher-level abstractions like D3 and Dimple make it easier, and bring Javascript within reach of data scientists who might  otherwise better sped their time elsewhere. Dimple is a relatively easy tool to add to the data science toolbox, and one that can bring portable, interactive graphics to data consumers and practitioners everywhere.


<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dimple/2.3.0/dimple.latest.min.js"></script>

<script type="text/javascript">
d3.select('#chartContainer')
  .append("h3")
  .text("Where Candidates Spend Their Time")
  .style('margin-left', '50px');
d3.select('#chartContainer')
  .append("p")
  .text("Share of Time Spent Campaigning in the Early States Through July 31")
  .style('margin-left', '50px');

  var myChart;
  var svg = dimple.newSvg("#chartContainer", "100%", 450);
  d3.csv("/data/candidateshares.csv", function (data) {
    myChart = new dimple.chart(svg, data);
    myChart.setMargins("50px", "0px", "0px", "120px");
    myChart.addCategoryAxis("x", "Candidate");
    myChart.addCategoryAxis("y", "State");
    var z = myChart.addPctAxis("z", "Share");
    var s = myChart.addSeries("Candidate", dimple.plot.bubble);
    myChart.draw();
  });
  window.onresize = function () {
    myChart.draw(0, true);
};
</script>
