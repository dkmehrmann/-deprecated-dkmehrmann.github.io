---
layout: post
title: "Debate Bump"
author: "Andrew Mehrmann"
date: "August 16, 2019"
output: html_document
categories: election ds
tags: election
---

Notebook to pull data is [here](https://colab.research.google.com/drive/1ER_FOn1NRa368WRF29EI1UBiQOm2GWRy). Data can be updated by replacing the file in the `/data` directory.

Uses data from electionbettingodds.com.



<div id="chartContainer"></div>

<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="http://dimplejs.org/dist/dimple.v2.1.6.min.js"></script>
<script type="text/javascript">
  var svg = dimple.newSvg("#chartContainer", "100%", 450);
  var myChart;
  d3.csv("/data/debatebump.csv", function (data) {
    myChart = new dimple.chart(svg, data);
    myChart.setMargins("50px", "30px", "0px", "120px");
    x1 = myChart.addCategoryAxis("x", ["Candidate", "variable"]);
    x2 = myChart.addCategoryAxis("x", "Candidate");
    y = myChart.addMeasureAxis("y", "value");
    y.tickFormat = ",.1f";
    myChart.addSeries("variable", dimple.plot.bar);

    var net = myChart.addSeries("Net", dimple.plot.line, [x2, y]);
    net.aggregate = dimple.aggregateMethod.sum;

    x2.hidden = true;

    x1.addGroupOrderRule(["First Debate", "Second Debate"]);

    myChart.addLegend(0, 10, 410, 20, "right");
    myChart.draw();
  });
  window.onresize = function () {
    myChart.draw(0, true);
};
</script>
