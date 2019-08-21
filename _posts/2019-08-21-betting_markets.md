---
layout: post
title: "Electoral Betting Markets"
author: "Andrew Mehrmann"
date: "August 21, 2019"
output: html_document
tags: election
---

<div id="chartContainer"></div>

I used [aggregate data from a popular prediction market](https://electionbettingodds.com) to look at how each candidate's chance of winning the Democratic nomination changed between the day before and the day after each debate. Note that candidates with higher probabilities have a larger opportunity to move around in the probability space, so larger movements don't necessarily mean better or worse debate performances.

This graphic is made using [Dimple.js](http://dimplejs.org/). If you'd like to learn more about using Dimple, see [my previous post](/2019/08/20/dimple_for_ds.html).

Keep reading to learn more about prediction markets and how they relate to elections!

<hr>

## Prediction Markets

Did you know that you can bet on the outcome of the US Election? How much do you think each candidate would be willing to bet on themselves winning the Presidency? Wouldn't politics be more fun and honest if everybody put their money where their mouth is?

From kitchen tables to smokey basements, how you bet tells us a lot about what you believe, perhaps even more than what you say or even think you believe. When applied to politics, how people bet inherently tells us what they believe, not what they want us to think they believe, because there is now a direct cost to lying or misleading.

[Prediction markets](https://en.wikipedia.org/wiki/Prediction_market) make it possible to bet directly on the outcome of virtually any event. If you head to [PredictIt](https://www.predictit.org/markets/1/US-Elections) right now, you can buy a share of Donald Trump winning the 2020 election for $0.44. If he wins, you'd make $1 per share.
If you buy a share, and the true probability of him winning is exactly 44%, you'd be expected to come out even (44% chance of winning a $1 is an expected revenue of $0.44, exactly what you spent on the share).

If you believe the probability is higher than 44%, say 50%, you would also believe that your expected revenue is $0.50, so you'd expect to profit $0.06 off of every share. The fascinating thing about prediction markets is that you are buying and selling shares with other bettors, just like a stock market. And just like a stock market, your demand for shares (based on your belief that Trump has a higher likelihood of winning than 44%) would eventually raise the price level to a new equilibrium if you had enough capital (and guts) to keep buying shares until the marginal profit of each additional share was 0, or the point at which the price of a share was $0.50.

In this sense, an efficient market means that the price corresponds to the probability of that event happening. Since prediction markets reflect the aggregate belief of those engaged with the market, they represent a pretty decent prediction of the likelihood of an event occuring.

## Betting on Red/Blue

Prediction markets have been [shown empirically](http://researchdmr.com/RothschildPOQ2009.pdf) to be more predictive than polls in US elections. When compared to a predictive model like [the one employed at FiveThirtyEight](https://fivethirtyeight.com/features/a-users-guide-to-fivethirtyeights-2016-general-election-forecast/) they perform slightly worse (but could be adjusted to perform better, according to the author above).

Prediction markets, when operating efficiently, offer two key benefits over polls: they **respond quickly to new information,** and they give **probabilistic predictions.** Polls often take days to reflect new information and require statistical maneuvering to give probabilistic predictions. With the amount of press that polls get, it's surprising to me that there is no similar coverage of the prediction markets.

An example of where prediction markets are especially useful is in monitoring debate performances. [The chart above](#chartContainer) demonstrates how one prediction market reacted to the first two debates within a day of their conclusion. These debate bumps [are usually temporary](https://edition.cnn.com/2019/08/15/politics/debate-bumps-polling/index.html), but can provide insight to a campaign as to how their candidate is performing, among other things.

The relationship between prediction markets and polls is a tricky one. On the one hand, we expect polls to influence the prediction markets, as each new poll gives the bettors new information on the chances of each candidate winning. But the prediction market can also price in information quicker than polls, so there might also exist a lagged correlation in the other direction.

That said, polls and prediction markets don't always tell the same story. I've produced some plots below of the 2016 primaries and general election, as well as the 2020 race to show and average of the polls recorded by [RealClearPolitics](https://RealClearPolitics.com) moves with the prediction markets aggregated at [ElectionBettingOdds](https://ElectionBettingOdds.com).

I didn't account for sample size or pollster bias in the polling average, but instead took a 15-day rolling average of all polls collected by RCP. As the data is only used for visual comparison, I assume this is not a huge deal as the trend lines for a sophisticated average and my rolling average should look about the same.

### 2016 Republican primary

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_GOP_BettingvsPolls.png">
</p>

The RCP polls stop a little short of Trump clinching the nomination, hence the missing data in the upper plot.

In this example, the polls and the betting markets pretty much agree, and this is what we expect under most circumstances. If polls had suggested a different reality than what the prediction market did, bettors could have taken advantage of that information and placed bets until the market lined up with reality.

Remember that **the bottom plot does not show a probability of the candidate winning,** it shows a polling average; candidates can be polling 5 points apart but have a huge gap in terms of win probability. Turning polls into win probabilities is a large undertaking, and not the focus of this article. Nevertheless, we can still expect the *rank ordering* of candidates by polling average and prediction market win probability to be the same.


### 2016 Democratic Primary

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_DEM_BettingvsPolls.png">
</p>

In this case, this prediction market gave very little chance to Sanders winning the nomination, even when he and Clinton were polling neck-and-neck in April 2016. Possibly by luck, this prediction market ignored the spike in polling and still gave Clinton a large shot at winning the nomination, which she eventually did.

### 2016 Presidential Election

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_GEN_BettingvsPolls.png">
</p>

The 2016 Presidential Election gives a more extreme example of polls and prediction markets disagreeing. For almost a month, Trump was outpolling Clinton consistently, but bettors in this market only gave him about a 1 in 3 shot of winning at his peak.

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_ElectionDay_BettingMarket.png">
</p>

On election day, this prediction market gave Trump about a 1-in-5 shot of winning the Presidency. Since markets respond quickly to new information, you can actually see the point at which more people than not started to believe Trump would pull off the unlikely (about 9:45pm ET).

Compare this with others who gave probabilistic predictions fo the 2016 race:

> The Princeton Election Consortium gave Clinton a 99 percent chance of winning. The Huffington Post’s forecast gave Clinton 98 percent, PredictWise gave her 89 percent, and the New York Times’s The Upshot gave her 85 percent. Even FiveThirtyEight, which was the most bullish on Trump, gave Clinton over a 71 percent chance of winning.

- Source: [Politico](https://www.politico.com/magazine/story/2016/12/the-worst-political-predictions-of-2016-214555)

Note that [PredictWise](https://markets.predictwise.com/markets/) is also a prediction market aggregator run by David Rothschild, the Author of the paper linked above. The reason I used ElectionBettingOdds for this article is that it was simply the first one I found.

### 2020 Democratic Primary

A basic premise of this article is that, much like polls, we can use prediction markets to help predict future events. In theory, prediction markets bake in all available information, leverage the wisdom of crowds, and provide an unbiased view of the chances of, say, Elizabeth Warren winning the Democratic Nomination.

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2020_DEM_BettingvsPolls.png">
</p>

In the 2020 Democratic primary, Joe Biden has been leading in polls since RCP started collecting them. Prediction markets, on the other hand, have named several different frontrunners over the last few months. Harris once had the lead, and now it is Warren leading the pack, presumably on the backs of their respective debate performances.

It is unclear how much predictive power these markets have this far from the nomination; the study linked above found unsurprisingly that prediction error tends to increase as you move further away from an event in time. Despite these shortcomings, polls and prediction markets can help understand the mechanisms that drive public support for a given candidate.

It was clear, for example, that [Harris's attack on Biden during the first debate](https://www.nytimes.com/2019/07/31/us/politics/kamala-harris-biden-busing.html) netted her a great deal of (albeit temporary) support. It is also clear that Warren is doing something right, with her recent surge in polls and newfound place at the top of the prediction market. If campaigns rely on feedback from the public to inform their strategy, prediction markets should absolutely be part of the equation.

### 2020 Presidential Election

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/Conditional_Win_Probs.png">
</p>

The last plot I want to show is each candidate's *conditional* win probability. Taken literally, this means **the chances a candidate will win the presidency given they win their party's nomination**. Bettors can place wagers on who will win the nomination as well as who will win the presidency, so we can back out the conditional probability by dividing the candidate's chances of winning the presidency by the chances of them winning their party's nomination (for Trump, I ignored the possibility of a contested primary, so his conditional probability is equal to his prediction market win probability).

For example, if Warren is given a 50% chance of winning the primary and a 20% chance of winning the presidency, her implicit *conditional win probability* is 0.2/0.5 = 0.4. This makes sense because her chances of winning the nomination (0.5) times her chances of winning the presidency *if* she wins the nomination (0.4) give her chances overall of winning the presidency (0.2).

Now there are a whole lot of caveats to give here. For starters, this assumes that the markets are efficient. Notice Beto at one time had about a 65% conditional chance of winning the presidency while the next closest person was Sanders at 55%. I have nothing against Beto, but I don't think he's got *that* much charisma. This probably indicates that the markets are a little out of sync (and therefore there is a chance to make some money via arbitrage).

The other caveat is that calculating the conditional probability like this implies the events are *independent*, which they certainly are not. If support for a candidate in the Primary changes, it's possible that whatever event triggered that change will also change their support in a general election.

Nevertheless, this could give a hint as to which candidates are more "electable" in a general election. Interestingly, the two most progressive candidates in the field - Warren and Sanders - have consistently shown high levels of electability when measured like this, which runs contrary to the centrist strategies of Harris and Biden. See [here](https://primary.guide/) for real-time updates to these conditional probabilities.

## Conclusion

Prediction Markets are a really interesting tool that can supplement our ability to predict the future. When applied to politics, they can provide information more quickly than polls, and naturally aggregate more disparate sources of information. This can be helpful to inform campaign strategy or otherwise understand factors that influence election outcomes in smaller time windows than public opinion polls.

Prediction markets alone do not replace polling, or polls-based models, but they do provide a promising alternative or supplement, especially when speed-to-insight is a concern.

## Appendix

Notebook to pull data and generate plots is [here](https://colab.research.google.com/drive/1ER_FOn1NRa368WRF29EI1UBiQOm2GWRy). You can read more about how the data is generated [here](https://electionbettingodds.com/about.html).


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
