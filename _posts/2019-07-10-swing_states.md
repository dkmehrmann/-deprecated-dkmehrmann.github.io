---
layout: post
title: "Analysis of the 2020 Democratic Primary Polls in Swing States"
author: "Andrew Mehrmann"
date: "July 10, 2019"
output: html_document
categories: election ds
---

*The [notebook for this analysis](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt) will be updated periodically with the most recent results. You can also create a copy or [run it yourself](https://stackoverflow.com/questions/52011084/what-is-playground-mode-in-googles-colaboratory) to get near-real-time updates.*
<hr>

## Background

Keeping with the spirit of [my previous post](/election/2019/07/06/data_politics_do_good.html), I created a simple analysis of polling data that attempts to answer a question voters seem to care about and that I haven't seen answered very well before: *if the Democrats want to beat Donald Trump, who should they choose as their candidate in the Primary?* Voters [perceive](https://fivethirtyeight.com/features/democrats-think-biden-is-electable-but-hes-not-everyones-first-choice/) an establishment democrat as having better chances than a more progressive candidate, and indeed [this is an issue Democratic voters seem to care about](https://fivethirtyeight.com/features/democrats-care-more-about-winning-than-usual/).

To see which current Democratic contender has the best odds at beating Trump, one might be tempted to look at one of the numerous national-level polls that pit each candidate against the incumbent president. These polls ask a set of questions that look like this:

> If the presidential race in 2020 was between Donald Trump and Joe Biden, who would you vote for?

Source: [Rasmussen Reports](http://www.rasmussenreports.com/public_content/politics/questions/pt_survey_questions/july_2019/questions_white_house_watch_biden_vs_trump_june_23_27_and_june_30_july_2_2019)

And based on the results of that poll, you might write an [article like this](https://edition.cnn.com/2019/07/08/politics/donald-trump-2020-electability-washington-post-abc-poll/index.html) and says things like this:

> Except that in a new Washington Post-ABC News poll there's at least the suggestion that who Democrats nominate could make a difference in whether Trump wins a second term or not. Former Vice President Joe Biden leads Trump 53%-43% in that national survey. But Biden is the only Democrat with a statistically significant edge over the incumbent. California Sen. Kamala Harris took 48% to Trump's 46%, while Vermont Sen. Bernie Sanders stood at 49% to Trump's 48%. Trump was tied with both Massachusetts Sen. Elizabeth Warren and South Bend Mayor Pete Buttigieg.

What on earth does statistical significance have to do with winning the election? Yes, within your sample there is at least enough of a difference between Yeas and Nays to suggest that the difference between selecting Biden vs. Trump in this particular poll was unlikely due to chance. But that says nothing about how representative your sample is of 2020 voters (it almost certainly isn't), and even if you had perfect internal and external validity it would only suggest that Biden was currently winning *the popular vote*. We saw *just last election* that winning the popular vote doesn't necessarily get you elected, and further we saw that the bias in the popular vote was *toward republicans* (i.e. a Democrat had to win more than a simple majority in the popular vote to with the EC, a Republican had to win less). It follows that to understand a candidate's chances of getting elected you have to take the electoral college into account.

To give a little background, remember that each candidate needs to receive 270 electoral votes - a simple majority of the 538 up for grabs - to win the general election. These electoral votes are usually winner-take-all within each state ([exceptions being Nebraska and Maine](https://www.270towin.com/content/split-electoral-votes-maine-and-nebraska/)), with each state's number of electoral votes supposedly proportional to it's population. Some states are pretty predictable in how they vote each election (we won't see a Blue Wyoming this year, for example, and you can quote me), but the ones that aren't are called "swing states."

This year, the expectation for swing states looks something like this (swing states in Brown):

<div align="center">
  <a href="https://www.270towin.com/maps/XRVOV">
    <img src="https://www.270towin.com/presidential_map_new/maps/XRVOV.png" width="500">
  </a>
  <br>
  <small>
    <img style="vertical-align: middle;" src="https://www.270towin.com/uploads/3rd_party_270_30px.png" alt="" />
    Click the map to create your own at <a href="https://www.270towin.com/maps/XRVOV">270toWin.com</a>
  </small>
</div>
<br>

To win the General Election, a Democratic candidate will need **88 electoral votes** from this group of swing states in addition to the 182 they're reasonably expected to win without much fuss to get to the magical total of 270. There are 230 up for grabs in these swing states, and last election Trump took most of them in addition to the 126 from deep-red states despite losing the popular vote. I'm ignoring for clarity the special cases Maine and Nebraska where they don't award all their electoral votes to a single candidate (see link above for explanation).

To get a clearer picture of which current Democratic candidate has the best odds at winning a general election, we can simply look at head-to-head polls between Trump and a hypothetical challenger in these swing states. My thesis is basically that National-level polls that ask this question are at risk of suffering the same bias that the popular vote suffers, namely that it doesn't track so well with the electoral college as of late, so we can essentially remove or reduce the biasing effects of those states that vote deep-blue or deep-red by only looking at swing states.


## Why this Matters

Underlying this whole thing is the concept of [tactical voting](https://en.wikipedia.org/wiki/Tactical_voting), which basically states that voters may not (or should not) vote for their *sincere preference* when there is a rational reason to vote some other way (and there are several, like voting for Biden to ensure Trump is beaten). In other words, each voter would select the candidate that maximizes utility, with each candidates expected utility given as the product of their probability of winning and the utility that voter gains by the candidate becoming president. Or something like that.

A notion of electability may entice us to vote for a candidate based on their ability to win rather than our agreement with their views. This isn't inherently wrong - it's just game theoretically rational - but it can be damaging to certain types of candidates, especially minorities and women who are [perceived as less electable than they might rightly be.](https://www.avalanchestrategy.com/electability) Regardless of your opinion on who is best suited to serve as president, it is important that we don't rely on skewed or incomplete data to inform our ideas of a candidate's chances of winning before they've even been given a chance to run.

The point is that each candidate's chances of wining the general election should (and do) play a huge part in who a voter choses in the primaries, but we're relying on potentially biased data to inform that decision. My analysis attempts to paint a clearer picture of who is "electable" so we don't fall back on outdated notions and misleading rhetoric that may perpetuate a status quo that is likely maintained by those with power they wish to keep. To be sure, my simple average of polls makes no promises as to what each candidate's likelihood of winning is, but I hope to at least steer the conversation back in a fair and empirical direction.


## Analysis

To do this, I used data from [FiveThirtyEight](https://data.fivethirtyeight.com/) to create an **Analysis of the 2020 Democratic Primary Polls in Swing States** ([code and notebook here](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt)). It combines recent (from last 8 weeks) polling data to report two things:

1. each serious Democratic candidate's polling average in each swing state and
2. a weighted average of the polls the swing states for each candidate

Serious Democratic candidates are defined as **Biden**, **Warren**, **Sanders**, and **Harris** (each are polling over 10% on average in the primary polls). Here is the current (as of this writing) polling average for each candidate within each state in a head-to-head matchup with Donald Trump:

<table border="1" class="table">  <thead>    <tr style="text-align: right;">      <th>state</th>      <th>eVotes</th>      <th>popvoteDem16</th>      <th>Biden</th>      <th>Warren</th>      <th>Sanders</th>      <th>Harris</th>    </tr>    </thead>  
<tbody>    
<tr>      <th>IA</th>      <td>6</td>      <td>0.449</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    
<tr>      <th>TX</th>      <td>38</td>      <td>0.453</td>      <td>0.522</td>      <td>0.495</td>      <td>0.484</td>      <td>0.478</td>    </tr>    <tr>      <th>OH</th>      <td>18</td>      <td>0.457</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>GA</th>      <td>16</td>      <td>0.473</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NC</th>      <td>15</td>      <td>0.481</td>      <td>0.509</td>      <td>0.498</td>      <td>0.525</td>      <td>0.491</td>    </tr>    <tr>      <th>AZ</th>      <td>11</td>      <td>0.481</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>FL</th>      <td>29</td>      <td>0.494</td>      <td>0.513</td>      <td>0.503</td>      <td>0.512</td>      <td>0.491</td>    </tr>    <tr>      <th>WI</th>      <td>10</td>      <td>0.496</td>      <td>0.535</td>      <td>0.500</td>      <td>0.540</td>      <td>NaN</td>    </tr>    <tr>      <th>PA</th>      <td>20</td>      <td>0.496</td>      <td>0.539</td>      <td>0.485</td>      <td>0.517</td>      <td>0.500</td>    </tr>    <tr>      <th>MI</th>      <td>16</td>      <td>0.499</td>      <td>0.545</td>      <td>0.507</td>      <td>0.532</td>      <td>0.518</td>    </tr>    <tr>      <th>NH</th>      <td>4</td>      <td>0.502</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>MN</th>      <td>10</td>      <td>0.508</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NV</th>      <td>6</td>      <td>0.513</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>ME</th>      <td>4</td>      <td>0.516</td>      <td>0.540</td>      <td>0.520</td>      <td>0.530</td>      <td>0.520</td>    </tr>    <tr>      <th>CO</th>      <td>9</td>      <td>0.527</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>VA</th>      <td>13</td>      <td>0.528</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NM</th>      <td>5</td>      <td>0.547</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>  </tbody></table>

`eVotes` is the number of electoral votes in each state. `popvoteDem16` is the proportion of the vote relative to Trump that HRC won in each state in 2016. Cells with `NaN` represent state-candidate combinations for which there are no polls (within the last 8 weeks). All figures are reported relative to Trump in the sense that any number above 0.5 would represent a candidate is polling better than Trump in that state (third-party candidates and undecideds are averaged into the Democrat and Trump proportionally).

Here is the same data in graphical form:

<p align="center">
  <img src="/figs/2019-07-10-swing_states/poll_avgs_states.png">
</p>

It is also informative to look at the polling averages in the swing states compared to nationwide. The final swing state figure for each candidate is weighted by each state's number of electoral votes, ignoring the states for which a candidate has not been represented by a head-to-head poll with Donald Trump (see NB below regarding the shortcomings of averaging the swing states together):

<p align="center">
  <img src="/figs/2019-07-10-swing_states/polling_avg_trump.png">
</p>

Remember that in order to win a Democratic candidate need not take a majority of the electoral votes in this group of states - they only need 88 - barring something unexpected in the stronghold states. Therefore it is possible that a Democratic candidate wins while taking only a handful of these (say Texas, Florida, Pennsylvania, and Maine), so don't read this as "only candidates polling over 0.5 are more likely to win than lose the election" as one might be tempted to (edit: I will remove the horizontal line in future analyses).

Given the above, this analysis seem to support my thesis that **national numbers reflect more support for the Democratic challenger than polls in the swing states.** Note however that many of the "missing" polls are from states that Trump won in 2016, and are likely contributing some bias towards him. Statistically it is also possible that the difference between the National and Swing State numbers are due to chance, but I did not check this because it would be difficult to propagate all the uncertainty through my analysis and I don't think it would really change anything to learn that things are too close to call right now.

At any rate, this at least points out how *little* information we have about each candidate's actual chances of beating Trump. 2016 was a year of surprises, and I'm sure 2020 will bring new surprises of critical importance in the swing states (for example, Biden polling higher than expected in Texas).

It will also be interesting to watch the rank ordering of each candidate based on their likelihood to beat Trump and compare the rankings based on national polls to rankings based on just polls in the swing states - the former will likely be what the media uses, and the latter will probably be more predictive and informative.

Ignoring the risks (mentioned below) of taking an average over states, it turns out that the national polls currently suggest the same ranking of candidates as the polls within the swing states. In other words, the national polls pick the same winner (and second, third, and forth place) as my analysis of just the swing states. It will be interesting to see if this result holds as more data comes in, but at least for now my inquiry seems not to lend much new information but rather a new way to look at who is more "electable" in 2020.

*NB: The astute observer might observe that a weighted average of polls over a group of states is the exact thing I'm hoping to avoid by creating this analysis. Namely, you could still get into a situation where a candidate wins the popular vote across those swing states but receives less electoral college votes than their competitor. That criticism is certainly valid, but I think the average of polls in swing states is still a more valuable figure than what is reported by national polls. At the very least, it probably reduces (but doesn't eliminate) whatever bias is resulting in the discrepancy between electoral college and popular vote. More technical details can be found in the [notebook](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt). Additionally, an analysis is only as good as the data it's built on and mine isn't built on much. It's more of an exposition and possible starting point for others to explore their curiosities.*

## Conclusions

There is a bunch of confusing data thrown around during any election cycle, and I think paring things down and looking at them with a critical eye can help tease out when data is being used to inform and when it is being used to influence. Maybe the most important issue facing Democratic voters in 2020 is beating Trump, and luckily that's a place where data can be really informative if used carefully and honestly.

I have seen a few attempts at taking an empirical approach to this question, but most of them have used national-level polls which I think is a serious mistake. Furthermore, this notion of electability can have negative consequences for non-whites and females, an issue in itself that I believe folks on the left will (or should) be concerned with, especially during a primary season with such a high percentage of women and minorities.

I will "mind the gap" between the national polls and swing state polls and post an update if anything interesting should happen, but I think the takeaway right now is that we just don't have that much polling data where it counts.
