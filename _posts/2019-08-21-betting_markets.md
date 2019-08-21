---
layout: post
title: "Electoral Betting Markets"
author: "Andrew Mehrmann"
date: "August 21, 2019"
output: html_document
tags: election
---

<div id="chartContainer"></div>

I used [aggregate data from a popular prediction market](electionbettingodds.com) to look at how each candidate's win probability changed between the day before each debate and the day after. Keep reading to learn more!

<hr>

## Prediction Markets and Politics

Did you know that you can bet on the outcome of the US Election? How much do you think each candidate would be willing to bet on themselves winning the Presidency? Wouldn't politics be more fun and honest if everybody put their money where their mouth is?

From kitchen tables to smokey basements, how you bet tells us a lot about what you believe, perhaps even more than what you say or even think you believe. When applied to politics, how people bet inherently tells us what they believe, not what they want us to think they believe, because there is now a direct cost to lying or misleading.

In this sense, a prediction market can be a really good indicator of what everybody believes is the most likely outcome for some event we wish to predict. In fact, this has been [shown empirically](http://researchdmr.com/RothschildPOQ2009.pdf) to apply to political elections in the US.

Prediction markets, when operating efficiently, offer two key benefits: they **respond quickly to new information,** and they give **probabilistic predictions.** The same cannot be said for polls, which often take days to reflect things like scandals or debate performances and require statistical maneuvering to give probabilistic predictions.

Speaking of debate performances, [the chart above](#chartContainer) demonstrates how prediction markets reacted to the first two debates within a day of their conclusion. These debate bumps [are usually temporary](https://edition.cnn.com/2019/08/15/politics/debate-bumps-polling/index.html), but can provide insight to a campaign as to how their candidate is performing, among other things.


## Prediction Market vs. Polls

In general, Prediction Markets and polls should be correlated. We expect polls to influence the prediction market, as each new poll gives the bettors new information on the chances of each candidate winning. But the prediction market can also price in information quicker than polls, so there might also exist a lagged correlation in that direction.

That said, polls and prediction markets don't always tell the same story. I've produced some plots below of the 2016 primaries and general election, as well as the 2020 race to show and average of the polls recorded by [RealClearPolitics](RealClearPolitics.com) moves with the prediction markets aggregated at [ElectionBettingOdds](ElectionBettingOdds.com).

I didn't account for sample size or pollster bias in the polling average, but instead took a 15-day rolling average of all polls collected by RCP. This would be an issue if I was doing something specific with the data, but the trends should look almost identical between a sophisticated average and my method for visual comparison.

### 2016 Republican primary

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_GOP_BettingvsPolls.png">
</p>

The RCP polls stop a little short of Trump clinching the nomination, hence the missing data in the upper plot.

In this example, the polls and the betting markets pretty much agree, and this is what we expect. If polls had suggested a different reality than what the prediction market did, bettors could have taken advantage of that information and placed bets until the market lined up with reality.

We expect the spread of the lines to be greater in the top plot because **the bottom plot does not show a probability of the candidate winning,** it shows a polling average. Turning polls into win probabilities is a large undertaking, and not the focus of this article.


### 2016 Democratic Primary

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_DEM_BettingvsPolls.png">
</p>

In this case, the prediction markets gave very little chance to Sanders winning the nomination, even when he and Clinton were polling neck-and-neck in April 2016.

### 2016 Presidential Election

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_GEN_BettingvsPolls.png">
</p>

The 2016 Presidential Election gives a more extreme example of polls and prediction markets disagreeing. For almost a month, Trump was outpolling Clinton consistently, but prediction markets only gave him about a 1 in 3 shot of winning.

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_ElectionDay_BettingMarket.png">
</p>

This prediction market gave Trump about a 1-in-5 shot of winning the Presidency on election day. Since markets respond quickly to new information, you can actually see the point at which people started to believe Trump would actually win (about 9:45pm ET).

Compare this with others who gave probabilistic predictions fo the 2016 race:

> The Princeton Election Consortium gave Clinton a 99 percent chance of winning. The Huffington Post’s forecast gave Clinton 98 percent, PredictWise gave her 89 percent, and the New York Times’s The Upshot gave her 85 percent. Even FiveThirtyEight, which was the most bullish on Trump, gave Clinton over a 71 percent chance of winning.

- Source: [Politico](https://www.politico.com/magazine/story/2016/12/the-worst-political-predictions-of-2016-214555)

Note that [PredictWise](https://markets.predictwise.com/markets/) is also a prediction market aggregator run by David Rothschild, the Author of the paper linked above. The reason I used ElectionBettingOdds for this article is that it was simply the first one I found.

### 2020 Election

The basic premise of this article is that, much like polls, we can use prediction markets to help predict future events. In theory, prediction markets bake in all available information, leverage the wisdom of crows, and provide an unbiased view of the chances of, say, Elizabeth Warren winning the Democratic Nomination.

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2020_DEM_BettingvsPolls.png">
</p>

In the 2020 Democratic primary, Joe Biden has been leading in polls since RCP started collecting them. Prediction markets, on the other hand, have named several different frontrunners over the last few months. Harris once had the lead, and now it is Warren, presumably on the backs of their respective debate performances.

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/Conditional_Win_Probs.png">
</p>

The last plot I want to show is each candidate's *conditional* win probability . Literally, this means **the chances a candidate will win the presidency given they win their party's nomination**. Bettors can place wagers on who will win the nomination as well as who will win the presidency, so we can back out the conditional probability by dividing the candidate's chances of winning the presidency by the chances of their winning their party's nomination (for Trump, I ignored the possibility of a contested primary, so his conditional probability is equal to his prediction market win probability).

For example, if Warren is given a 50% chance of winning the primary and a 20% chance of winning the predidency, her implicit *conditional win probability* is 0.2/0.5 = 0.4. This makes sense because her chances of winning the nomination (0.5) times her chances of winning the presidency *if* she wins the nomination (0.4) give her chances overall of winning the presidency (0.2).

Now there are a whole lot of caveats to name here. For starters, this assumes that the markets are efficient. Notice Beto at one time had a 65% chance of winning the presidency while the next closest person was Sanders at 55%. I have nothing against Beto, but I don't think he's got *that* much charisma. This probably indicates that the markets are a little out of sync (and therefore there is a chance to make some money via arbitrage).

The other caveat is that calculating the conditional probability like this implies the events are *independent*, which they certainly are not. If support for a candidate in the Primary changes, it's possible that whatever event triggered that change will also change their support in a general election.

Nevertheless, this could give a hint at which candidates are more "electable" in a general election. See [here](https://primary.guide/) for real-time updates to these conditional probabilities.

## Conclusion

Prediction Markets are really interesting tools that can supplement our ability to predict the future. When applied to politics, they can provide information more quickly than polls, and naturally aggregate more disparate sources of information.

## Appendix: The Code

Notebook to pull data and generate plots is [here](https://colab.research.google.com/drive/1ER_FOn1NRa368WRF29EI1UBiQOm2GWRy).

## Appendix: Further Reading

* https://electionbettingodds.com/about.html
* https://floridapolitics.com/archives/301997-gamblers-say-these-candidates-will-get-the-biggest-post-debate-bump


<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dimple/2.1.6/dimple.latest.min.js"></script>

<style>
.dimple-tooltip-dropline {
  stroke-width:0 !important;
}
</style>

<script type="text/javascript">

d3.select('#chartContainer')
  .append("h3")
  .text("Who's Winning the Debates?")
  .style('margin-left', '50px');
d3.select('#chartContainer')
  .append("p")
  .text("According to the Betfair Prediction Market")
  .style('margin-left', '50px');

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
