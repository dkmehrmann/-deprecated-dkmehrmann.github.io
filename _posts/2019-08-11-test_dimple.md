---
layout: post
title: "Test Dimple Post"
author: "Andrew Mehrmann"
date: "August 11, 2019"
output: html_document
categories: election ds
---

This type of graphic uses data from the `/data` directory. I can simply update the data in that directory in order to update the graphic (instead of hosting the data elsewhere or relying on inline data).



<div id="chartContainer">

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
    // As of 1.1.0 the second parameter here allows you to draw
    // without reprocessing data.  This saves a lot on performance
    // when you know the data won't have changed.
    myChart.draw(0, true);
};
</script>
</div>
