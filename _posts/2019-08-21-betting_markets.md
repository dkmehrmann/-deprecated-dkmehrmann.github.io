---
layout: post
title: "Betting on Red (or Blue)"
author: "Andrew Mehrmann"
date: "August 21, 2019"
output: html_document
tags: election
---

<hr>

**Updated 2019-26-08**

* Expanded [Appendix](#appendix)
* Added plot labels to [2016 Republican Primary plot](#2016-republican-primary)
* Fixed typos and made edits for clarity

<hr>

## Preface: Debate Bumps

In this post I will briefly and superficially cover what prediction markets are and how they can be used to forecast and understand political outcomes. Before I dive into details, I want to give a contemporary example of using prediction markets to better understand and forecast political outcomes.

I used [aggregate data from a popular prediction market](https://electionbettingodds.com), where people can bet on things like "who will be the Democratic nominee for President of the United States," to look at **how each candidate's chance of winning the nomination changed between the day before and the day after each debate.** Note that candidates with higher probabilities have a larger opportunity to move around in the probability space, so larger movements don't necessarily mean better or worse debate performances.

<div id="chartContainer"></div>

These debate bumps [are usually temporary](https://edition.cnn.com/2019/08/15/politics/debate-bumps-polling/index.html), but can provide insight to a campaign as to how their candidate is performing or which strategies are or aren't effective. Using data from prediction markets in addition to public opinion polls can supplement our understanding of the relationship between cause (strong or weak debate performance) and effect (change in public opinion).

This graphic is made using [Dimple.js](http://dimplejs.org/). If you'd like to learn more about using Dimple, see [my previous post](/2019/08/20/dimple_for_ds.html). Keep reading to learn more about prediction markets and how they relate to elections!

<hr>

## Prediction Markets

Did you know that you can bet on the outcome of the US Election? How much do you think each candidate would be willing to bet on themselves winning the Presidency? Wouldn't politics be more fun and honest if everybody put their money where their mouth is?

[Prediction markets](https://en.wikipedia.org/wiki/Prediction_market) make it possible to bet directly on the outcome of virtually any event. If you head to [PredictIt](https://www.predictit.org/markets/1/US-Elections) right now, you can buy a share of Donald Trump winning the 2020 election for \\$0.44. If he wins, you'd make \\$1 per share.
If you buy a share, and the true probability of him winning is exactly 44%, you'd be expected to come out even (44% chance of winning a \\$1 is an expected revenue of \\$0.44, exactly what you spent on the share).

If you believe the probability is higher than 44%, say 50%, you would also believe that your expected revenue is \\$0.50, so you'd expect to profit \\$0.06 off of every share. If you're rational (and correct), you could find lots of these types of advantages, place many bets, and on average you'd come out a very rich person!

The fascinating thing about prediction markets is that you are buying and selling shares with other bettors, just like a stock market. And just like a stock market, your demand for shares (based on your belief that Trump has a higher likelihood of winning than 44%) would eventually raise the price level to a new equilibrium if you had enough capital (and guts) to keep buying shares until the marginal profit of each additional share was 0, or the point at which the price of a share was \\$0.50.

In reality, it's not one person but many people who buy and sell these shares until an equilibrium is reached. In this sense, **prices in prediction markets reflect the aggregate belief of the probability of an event or outcome.** Pretty neat!

## Markets vs. Polls

Prediction markets can give much the same information that certain public opinion polls can give, namely which candidate is most likely to win an election or nomination. Prediction markets, when operating efficiently, offer two key benefits over public opinion polls: they **respond quickly to new information,** and they give **probabilistic predictions.**

Polls often take days to reflect new information and require statistical maneuvering to give probabilistic predictions. What's more is that prediction markets have been [shown empirically](http://researchdmr.com/RothschildPOQ2009.pdf) to be more predictive than polls or models in US elections. This makes intuitive sense because people betting in these markets have access to polls and predictive models like the one at FiveThirtyEight *on top of* all the other information they may have at their disposal. With the amount of press that polls and models get, it's surprising to me that there is no similar coverage of the prediction markets.

The relationship between prediction markets and polls is a tricky one. On the one hand, we expect polls to influence the prediction markets, as each new poll gives the bettors new information on the chances of each candidate winning. But the prediction market can also price in information quicker than polls, so there might also exist a lagged correlation in the other direction. Indeed, you can even [bet on how a candidate will poll in the future](https://www.predictit.org/markets/detail/5740/What-will-Yang's-RCP-average-support-be-at-end-of-day-August-31), implying that these markets have information ahead of that reported in polls.

It's also important to note that polls and prediction markets don't always tell the same story. I've produced some plots below of the 2016 primaries and general election, as well as the 2020 race to show how the polls recorded by [RealClearPolitics](https://RealClearPolitics.com) correlate with the prediction markets aggregated at [ElectionBettingOdds](https://ElectionBettingOdds.com).

I didn't account for sample size or pollster bias in my polling average, but instead took a 15-day rolling average of all polls collected by RCP. As the data is only used for visual comparison, I assume this is not a huge deal as the trend lines for a sophisticated average and my rolling average should look about the same at this granularity.

### 2016 Republican Primary

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

The 2016 Presidential Election gives a more extreme example of polls and prediction markets disagreeing. For almost a month, Trump was outpolling Clinton consistently, but bettors in this market only gave him about a 1-in-3 shot of winning at his peak.

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2016_ElectionDay_BettingMarket.png">
</p>

On election day, this prediction market gave Clinton about an **80 percent** chance of winning the Presidency. Since markets respond quickly to new information, you can actually see the point at which more people than not started to believe Trump would pull off the unlikely (about 9:45pm ET).

Compare this with others who gave probabilistic predictions fo the 2016 race (note that PredictWise is another betting market aggregator):

> The Princeton Election Consortium gave Clinton a **99 percent** chance of winning. The Huffington Post’s forecast gave Clinton **98 percent**, PredictWise gave her **89 percent**, and the New York Times’s The Upshot gave her **85 percent**. Even FiveThirtyEight, which was the most bullish on Trump, gave Clinton over a **71 percent** chance of winning.

- Source: [Politico](https://www.politico.com/magazine/story/2016/12/the-worst-political-predictions-of-2016-214555)

Of course, one data point is not enough to conclude what the superior prediction method is (in fact, FiveThirtyEight beat the prediction markets in this case), but I find the range of predictions to be pretty remarkable.

### 2020 Democratic Primary

A basic premise of this article is that, much like polls, we can use prediction markets to help predict future events. In theory, prediction markets bake in all available information, leverage the wisdom of crowds, and provide an unbiased view of the chances of, say, Elizabeth Warren winning the Democratic Nomination.

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/2020_DEM_BettingvsPolls.png">
</p>

In the 2020 Democratic primary, Joe Biden has been leading in polls since RCP started collecting them. Prediction markets, on the other hand, have named several different frontrunners over the last few months. Harris once had the lead, and now it is Warren leading the pack, presumably on the backs of their respective debate performances.

It is unclear how much predictive power these markets have this far from the nomination; the study linked above found unsurprisingly that prediction error tends to increase as you move further away from an event in time. Despite these shortcomings, **polls and prediction markets can help understand the mechanisms that drive public support for a given candidate.**

Prediction markets suggest, for example, that [Harris's attack on Biden during the first debate](https://www.nytimes.com/2019/07/31/us/politics/kamala-harris-biden-busing.html) netted her a great deal of (albeit temporary) support. They also suggest that Warren is doing something right, with her steadily increasing value in prediction markets. If campaigns rely on feedback from the public to inform their strategy, prediction markets should absolutely be part of the equation.

### 2020 Presidential Election

<p align="center">
  <img src="/figs/2019-08-21-betting_markets/Conditional_Win_Probs.png">
</p>

The last plot I want to show is each candidate's *conditional* win probability. Taken literally, this means **the chances a candidate will win the presidency given they win their party's nomination**. Bettors can place wagers on who will win the nomination as well as who will win the presidency, so we can back out the conditional probability by dividing the candidate's chances of winning the presidency by the chances of them winning their party's nomination (for Trump, I ignored the possibility of a contested primary, so his conditional probability is equal to his prediction market win probability).

For example, if Warren is given a 50% chance of winning the primary and a 20% chance of winning the presidency, her implicit *conditional win probability* is 0.2/0.5 = 0.4. This makes sense because her chances of winning the nomination (0.5) times her chances of winning the presidency *if* she wins the nomination (0.4) give her chances overall of winning the presidency (0.2).

Now there are a whole lot of caveats to give here. For starters, this assumes that the markets are efficient. Notice Beto at one time had about a 65% conditional chance of winning the presidency while the next closest person was Sanders at 55%. I have nothing against Beto, but I don't think he's got *that* much charisma. This probably indicates that the markets are a little out of sync (and therefore there is a chance to make some money via arbitrage).

The other caveat is that calculating the conditional probability like this implies the events are *independent*, which they certainly are not. If support for a candidate in the Primary changes, it's possible that whatever event triggered that change will also change their support in a general election.

Nevertheless, this could give a hint as to which candidates are more "electable" in a general election. Interestingly, **the two most progressive candidates in the field - Warren and Sanders - have consistently shown high levels of electability** when measured like this, which raises questions for the centrists like Harris and Biden. See [here](https://primary.guide/) for real-time updates to these conditional probabilities.

## Conclusion

Prediction Markets and the data they generate can supplement our ability to predict the future. When applied to politics, they can provide information **more quickly** than polls, and naturally **aggregate disparate sources of information**. This can be helpful to inform campaign strategy or otherwise understand factors that influence election outcomes in smaller time windows than public opinion polls alone.

Prediction markets should certainly not replace polling, or polls-based models, but they do provide a promising alternative or supplement, especially when speed-to-insight is a concern.

## Appendix

Notebook to pull data and generate plots is [here](https://colab.research.google.com/drive/1ER_FOn1NRa368WRF29EI1UBiQOm2GWRy). You can read more about how the data is generated [here](https://electionbettingodds.com/about.html).

If you want to bet yourself, Betfair, [PredictIt](https://www.predictit.org/), and [Iowa Electronic Markets](https://iemweb.biz.uiowa.edu/markets/) are three markets I know about. Betfair is not available to folks inside the US, so I have chosen not to link to it above. PredictIt takes a healthy cut of any profits (5% withdrawal fee on total wealth and 10% of winnings), which [favors longshot bets](https://blog.predictwise.com/2016/05/betfair-v-predictit/), which is good to keep in mind when placing bets as well as when interpreting the prices as predictions. Iowa Prediction Markets [allegedly does not charge transaction fees](https://www.brookings.edu/blog/fixgov/2016/09/15/political-prediction-markets-what-are-they-good-for/), which might suggest they are more efficient than the other markets, depending on liquidity.

[PredictWise](https://markets.predictwise.com/markets/) is another prediction market aggregator run by David Rothschild, the author of the paper linked above. The reason I used ElectionBettingOdds for this article is that it was simply the first one I found, but it should be noted that while EBO boasts a [pretty remarkable track record](https://electionbettingodds.com/TrackRecord.html) for prediction, I have found errors in the data they used to generate their assessment and have [contacted the maintainers of the website](https://twitter.com/andrewmehrmann/status/1164490920173195265) to submit a correction. Although both of these rely on data from Betfair and PredictIt, they have their own formulas for calculating probabilities from the prices in each market, so they often show slightly different conclusions.

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
    x1 = myChart.addCategoryAxis("x", ["Candidate", "Debate"]);
    x2 = myChart.addCategoryAxis("x", "Candidate");
    y = myChart.addMeasureAxis("y", "Change");
    y.tickFormat = ",.1f";
    myChart.addSeries("Debate", dimple.plot.bar);

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
