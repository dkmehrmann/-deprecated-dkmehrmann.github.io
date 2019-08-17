---
layout: post
title: "Test Dimple Post"
author: "Andrew Mehrmann"
date: "August 11, 2019"
output: html_document
categories: election ds
tags: technical
---

Notebook to pull data is [here](https://colab.research.google.com/drive/1c3A8Zv98SD94QyEF-mwQ7EPzVzGCaSjo). Data can be updated by replacing the file in the `/data` directory.

Original Article: https://fivethirtyeight.com/features/where-are-candidates-spending-all-their-time/

(maybe this article talks about data viz concepts like x/y/size and how visualizing the data like this is better IMO. I think it goes in the technical section.)

<div id="chartContainer"></div>

<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="http://dimplejs.org/dist/dimple.v2.3.0.min.js"></script>

<script type="text/javascript">
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
