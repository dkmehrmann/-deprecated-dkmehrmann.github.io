---
layout: post
title: "Electoral Betting Markets"
author: "Andrew Mehrmann"
date: "August 21, 2019"
output: html_document
tags: election
---

## Who's Winning the Debates?

<div id="chartContainer"></div>

I used [data from prediction markets](electionbettingodds.com) to look at how each candidate's win probability changed between the day before each debate and the day after. Keep reading to learn more!

<hr>

Did you know that you can bet on the outcome of the US Election? How much do you think each candidate would be willing to bet on themselves winning the Presidency? Wouldn't politics be more fun and honest if everybody put their money where their mouth is?

From kitchen tables to smokey basements, how you bet tells us a lot about what you believe, perhaps even more than what you say or even think you believe. When applied to politics, how people bet inherently tells us what they believe, not what they want us to think they believe, because there is now a direct cost to lying or misleading.

In this sense, a prediction market can be a really good indicator of what everybody believes is the most likely outcome for some event we wish to predict. In fact, this has been [shown empirically](http://researchdmr.com/RothschildPOQ2009.pdf) to apply to political elections in the US.

Prediction markets, when operating efficiently, offer two key benefits: they **respond quickly to new information,** and they give **probabilistic predictions.** The same cannot be said for polls, which often take days to reflect things like scandals or debate performances and require statistical maneuvering to give probabilistic predictions.

## Prediction Market vs. Polls

### 2016 Republican primary

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_GOP_BettingvsPolls.png">
</p>

### 2016 Democratic Primary

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_DEM_BettingvsPolls.png">
</p>

### 2016 General Election

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_GEN_BettingvsPolls.png">
</p>

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_ElectionDay_BettingMarket.png">
</p>


### 2020 Election

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2020_DEM_BettingvsPolls.png">
</p>


<p align="center">
  <img src="/figs/2019-08-21-betting_markets/Conditional_Win_Probs.png">
</p>

See [here](https://primary.guide/) for real-time updates.


## Appendix: The Code

Notebook to pull data and generate plots is [here](https://colab.research.google.com/drive/1ER_FOn1NRa368WRF29EI1UBiQOm2GWRy).

## Appendix: Background

* https://electionbettingodds.com/about.html


<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dimple/2.1.6/dimple.latest.min.js"></script>

<style>
.dimple-tooltip-dropline {
  stroke-width:0 !important;
}
</style>

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
