---
layout: post
title: "This Election, use your Data Skills for Good"
author: "Andrew Mehrmann"
date: "July 6, 2019"
output: html_document
category: ds
---
<hr>
*The [notebook for this analysis](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt) will be updated periodically with the most recent results. You can also create a copy and run it yourself to get near-real-time updates.*
<hr>

I try to stay as far away from "politics" as possible. Facts often go by the wayside and we're left bickering in circles about who's righteous and who's evil and chances are we all want the same things anyway so really what's the point. I'm not going to change your mind and you're not going to change mine because we have fundamentally different values. So let's just have a beer and do our disagreeing at the ballot box, right?

This line of thinking lets me sleep quite well at night, but it is critically flawed. There are injustices being done and to let them go unchecked is to disregard our civic responsibility. Inaction is a choice, and to choose not to stand up for what's right is worse than cowardly, it's wrong.

I'm of course talking about the misuse of data in political commentary. (really, guy, that's the injustice you're standing up for?)

How many times have you - as a data consumer, advocate, or professional - heard a pundit or correspondent say something regarding "statistics" or "margin of error" that made your skin crawl? Fallacies or misunderstandings are one thing, but even worse, data is often deliberately used to mislead. Examples abound but it is not the point of this article to reproduce them here.

In response to these poisonous transgressions I'd like to offer an antidote. Instead of engaging in a heated debate with a coworker over one too many happy hour pints, buy yourself a six-pack and head home to your computer (we all know the best-waged battles start at a keyboard). Do war with these people and don't let them get away with it. **As experts, we have a duty to protect people from these practices of ignorance or malice.**

If it hasn't become clear yet, my goal with this article is to *inspire* you to do something good with your data and programming skills, specifically in response to what will be arguably one of the most important and public uses of data in recent history: the 2020 US Presidential Election. If punctuating my charge with over-the-top motivational language is what it takes then I'll gladly field the embarrassment of looking cheesy to do so.

It doesn't require a degree in statistics or a public platform like a blog or website in order to serve the public interest (those things help but only one of them is free). It just takes critical thinking, effort, and the desire to send a better-informed electorate to the ballot box in 2020. We have the power to choose, in this not-so-small way, the course of data history. So how do you want that story to go?


## Analysis of the 2020 Democratic Primary Polls in Swing States

Keeping with this spirit, I created a simple analysis of polling data that answers a question voters seem to care about and that I haven't seen answered very well before: *if the Democrats want to beat Donald Trump, who should they choose as their candidate in the Primary?* I have seen lots of talk about an establishment Democrat (i.e. Joe Biden) having better chances than a more progressive candidate (e.g. Warren, Sanders), and indeed [this is an issue Democratic voters seem to care about](https://fivethirtyeight.com/features/democrats-care-more-about-winning-than-usual/).

To see which current Democratic contender has the best odds at beating Trump, one might be tempted to look at one of the numerous national-level polls that pit each candidate against the incumbent president. These polls ask a set of questions that look like this:

> If the presidential race in 2020 was between Donald Trump and Joe Biden, who would you vote for?

Source: [Rasmussen Reports](http://www.rasmussenreports.com/public_content/politics/questions/pt_survey_questions/july_2019/questions_white_house_watch_biden_vs_trump_june_23_27_and_june_30_july_2_2019)

The problem with national-level polls is that they represent a sample statistic of *the popular vote*, and we saw *just last election* that winning the popular vote doesn't necessarily get you elected. It follows that to understand a candidate's chances of getting elected, you have to take the electoral college into account.

To do so, I used data from [FiveThirtyEight](https://data.fivethirtyeight.com/) to create an [Analysis of the 2020 Democratic Primary Polls in Swing States](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt). It isn't very technical and it didn't require a whole lot of time, but I had fun doing it and learning about Google Collaboratory (see [appendix](#appendix-tools)) while using data to answer a direct question I was interested in.

In my analysis, I report two things:

1. each serious Democratic candidate's polling average in each swing state and
2. a weighted average of the polls the swing states for each candidate

Serious Democratic candidates are defined as **Biden**, **Warren**, **Sanders**, and **Harris** (each are polling over 10% on average in the primary polls). Swing states are defined as those where the final vote within the state in 2016 was within 5.5% relative to the other major candidate. This fits in line with [consensus thinking about 2020 swing states](https://www.270towin.com/).

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

To win the General Election, a Democratic candidate will need **88 electoral votes** from this group of swing states in addition to the 182 they're reasonably expected to win without much fuss to get to the magical total of 270. There is are 230 up for grabs in these swing states, and last election Trump took most of them in addition to the 126 from deep-red states despite losing the popular vote. I'm ignoring for clarity the special cases Maine and Nebraska where they don't award all their electoral votes to a single candidate.

Here is the current (as of this writing) polling average for each candidate within each state in a head-to-head matchup with Donald Trump:

<table border="1" class="table">  <thead>    <tr style="text-align: right;">      <th>state</th>      <th>eVotes</th>      <th>popvoteDem16</th>      <th>Biden</th>      <th>Warren</th>      <th>Sanders</th>      <th>Harris</th>    </tr>    </thead>  
<tbody>    
<tr>      <th>IA</th>      <td>6</td>      <td>0.449</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    
<tr>      <th>TX</th>      <td>38</td>      <td>0.453</td>      <td>0.522</td>      <td>0.495</td>      <td>0.484</td>      <td>0.478</td>    </tr>    <tr>      <th>OH</th>      <td>18</td>      <td>0.457</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>GA</th>      <td>16</td>      <td>0.473</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NC</th>      <td>15</td>      <td>0.481</td>      <td>0.509</td>      <td>0.498</td>      <td>0.525</td>      <td>0.491</td>    </tr>    <tr>      <th>AZ</th>      <td>11</td>      <td>0.481</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>FL</th>      <td>29</td>      <td>0.494</td>      <td>0.513</td>      <td>0.503</td>      <td>0.512</td>      <td>0.491</td>    </tr>    <tr>      <th>WI</th>      <td>10</td>      <td>0.496</td>      <td>0.535</td>      <td>0.500</td>      <td>0.540</td>      <td>NaN</td>    </tr>    <tr>      <th>PA</th>      <td>20</td>      <td>0.496</td>      <td>0.539</td>      <td>0.485</td>      <td>0.517</td>      <td>0.500</td>    </tr>    <tr>      <th>MI</th>      <td>16</td>      <td>0.499</td>      <td>0.545</td>      <td>0.507</td>      <td>0.532</td>      <td>0.518</td>    </tr>    <tr>      <th>NH</th>      <td>4</td>      <td>0.502</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>MN</th>      <td>10</td>      <td>0.508</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NV</th>      <td>6</td>      <td>0.513</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>ME</th>      <td>4</td>      <td>0.516</td>      <td>0.540</td>      <td>0.520</td>      <td>0.530</td>      <td>0.520</td>    </tr>    <tr>      <th>CO</th>      <td>9</td>      <td>0.527</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>VA</th>      <td>13</td>      <td>0.528</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NM</th>      <td>5</td>      <td>0.547</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>  </tbody></table>

`eVotes` is the number of electoral votes in each state. `popvoteDem16` is the proportion of the vote relative to Trump that HRC won in each state in 2016. Cells with `NaN` represent state-candidate combinations for which there are no polls (within the last 8 weeks). All figures are reported relative to Trump in the sense that any number above 0.5 would represent a candidate is polling better than Trump in that state (third-party candidates and undecideds are averaged into the Democrat and Trump proportionally).

Here is the same data in graphical form:

<p align="center">
  <img src="/figs/2019-07-06-swing_states/poll_avgs_states.png">
</p>

Remember that the Democratic candidate need not take a majority of the electoral votes in this group of states - they only need 88 - barring something unexpected in the stronghold states. Therefore it is possible that a candidate wins while taking only a handful of these (say Texas, Florida, Pennsylvania, and Maine).

It might also be informative to look at the polling averages in the swing states compared to nationwide. The final swing state figure for each candidate is weighted by each state's number of electoral votes, ignoring the states for which a candidate has not been represented by a head-to-head poll with Donald Trump (see NB below regarding the shortcomings of averaging the swing states together):

<p align="center">
  <img src="/figs/2019-07-06-swing_states/polling_avg_trump.png">
</p>

Given the above, I conclude that **national numbers reflect more support for the Democratic challenger than polls in the swing states.** It is of course possible that the many "missing" polls are contributing some bias towards Trump (all but one of the extant polls come from states Trump won), or that the difference between the National and Swing State numbers are due to chance, but this finding is in line with expectation. Recall the outcome from last election where the Democratic candidate won the popular vote but lost big in the electoral college and especially in the swing states. As more data comes in, it will be interesting to see if this result holds.

We can also investigate the rank ordering of each candidate based on their likelihood to beat Trump and compare the rankings based on national polls to rankings based on just polls in the swing states. Ignoring the risks (mentioned below) of taking an average over states, it turns out that the national polls currently suggest the same ranking of candidates as the polls within the swing states. In other words, the national polls pick the same winner (and second, third, and forth place) as my analysis of just the swing states. It will be interesting to see if those orderings change as more polls come in, but at least for now the national polls aren't misleading on who is most likely to win against Trump (it's still Biden), they're just potentially misleading on how likely each candidate is to win.

Although my analysis doesn't expose some grand conspiracy against non-establishment Democrats, it still begs this question: in the presence of better information, why are the media still using nationwide polls in a way that mimics the exact same mistakes we made last cycle (i.e. assuming the popular vote is synonymous with the EC)? There is nothing *wrong* with reporting National Polls, but to do so without serious qualification is irresponsible at best and deliberately misleading at worst. It is the duty of those reporting these figures to inform the electorate that they do not accurately represent that which they are being purported to: each candidate's "electability."

*NB: The astute observer might observe that a weighted average of polls over a group of states is the exact thing I'm hoping to avoid by creating this analysis. Namely, you could still get into a situation where a candidate wins the popular vote across those swing states but receives less electoral college votes than their competitor. That criticism is certainly valid, but I think the average of polls in swing states is still a more valuable figure than what is reported by national polls. At the very least, it probably reduces (but doesn't eliminate) whatever bias is resulting in the discrepancy between electoral college and popular vote. More technical details can be found in the [notebook](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt). Additionally, an analysis is only as good as the data it's built on and mine isn't built on much. It's more of an exposition and possible starting point for others to explore their curiosities.*

## Why this Matters

Underlying this whole thing is the concept of [tactical voting](https://en.wikipedia.org/wiki/Tactical_voting), which basically states that voters may not (or should not) vote for their *sincere preference* when there is a rational reason to vote some other way (and there are several, like voting for Biden to ensure Trump is beaten). In other words, each voter would select the candidate that maximizes utility, with each candidates expected utility given as the product of their probability of winning and the utility that voter gains by the candidate becoming president. Or something like that.

A notion of electability may entice us to vote for a candidate based on their ability to win rather than our agreement with their views. This isn't inherently wrong - it's just game theoretically rational - but it can be damaging to certain types of candidates, especially minorities and women who are [perceived as less electable than they might rightly be.](https://www.avalanchestrategy.com/electability) Regardless of your opinion on who is best suited to serve as president, it is important that we don't rely on skewed or incomplete data to inform our ideas of a candidate's chances of winning before they've even been given a chance to run.

The point is that each candidate's chances of wining the general election should (and do) play a huge part in who a voter choses in the primaries, but we're relying on potentially biased data to inform that decision. My analysis attempts to paint a clearer picture of who is "electable" so we don't fall back on outdated notions and misleading rhetoric that may perpetuate a status quo that is likely maintained by those with power they wish to keep. To be sure, my simple average of polls makes no promises as to what each candidate's likelihood of winning is, but I hope to at least steer the conversation back in a fair and empirical direction.

## Conclusion

To me, politics can be fun and interesting and it's not as hard as you think to do something useful with some open data and a little patience. You don't have to throw a Neural Net at every problem to be valuable (although I'd love to see a NN take on FiveThirtyEight's model).

As data practitioners, political campaigns are our time to shine - where people say things like "statistical significance" on national television! Instead of vilifying those who wield statistics incorrectly or provoking our friends into an argument over minimum wage, let's do something productive with that superiority complex that's all too common of us people "in the know": let's dig into the data and see what we can find out.

It isn't a stretch to say that data, used improperly or maliciously, represents a threat to our democratic institutions. We've seen how people with skills like ours can use it to misinform and manipulate an unwitting population, and until regulation catches up I don't see any way to effectively stop it. But we've also seen how it can be used to save lives and create wellbeing, and I don't see why it can't be used for good in politics too. This is bigger than trying to get your party elected: it's about ensuring that bad actors don't use data to infringe on personal liberties like we've seen time and again, and currently the only way to stop a bad guy with data is a good guy with data.

Of course it is unlikely someone like me or perhaps yourself without a platform or online following will have much impact on the outcome of this election, or the way we as a society leverage the incredible power of data. But I believe it is our civic duty - just like voting - to use our gifts for the protection and advancement of our democratic institutions, however small the contribution.

<hr>

## Appendix: Tools

If you're digging what I've said so far, maybe know a bit of Python, and aren't exactly an expert on politics or analyzing political data (call it politicurious, maybe?), I'd like to turn your attention to two specific things I think can help turn your newfound energy into a productive coding session.

### Free, Open Political Data

There is a wealth of open data on politics if you know where to look. For example, this [fantastic and thorough blog post](https://medium.com/ndp-annotations/civic-and-political-apis-data-sets-and-websites-136fa63a0af1) lists several of them.

I'd also like to mention a couple more (some of which are in the previous article):

* [voteview](https://voteview.com/data) - Congressional voting records and ideological scores for members of Congress
* [OpenSecrets](https://www.opensecrets.org/open-data) - Lots of data on money in politics, like campaign contributions and lobbying efforts
* [FiveThirtyEight](https://data.fivethirtyeight.com/) - Great for polling data, haven't use it for much else but they publish lots of the data behind their awesome analyses

I usually prefer APIs to flat data sets because updating an analysis becomes as easy as rerunning the code (instead of redownloading the dataset first), and that might be especially important when analyzing a time-sensitive event like an election. One might be tempted to create an app that runs the analysis for each user, and if you plan on bringing an interactive experience to a broad audience of non-programmers that is probably your best option. Standing an app on top of a data science analysis is not trivial however, and for most of my analyses I prefer to skip that step and simply use a notebook instead. Which brings me to my next point tool...


### Google Collaboratory

[Google Collaboratory](https://colab.research.google.com/) is a space for you to host and run Jupyter notebooks in the cloud. If you have a Google account (like most of us do) it is free to use and you'll be up and running in seconds. Gone are the days of installing Anaconda, configuring Jupyter, forgetting your password, looking up how to reset the password, installing packages, and having your session die when you accidentally close your laptop. What's especially exciting is that these notebooks are hosted and run in their own cloud-based runtime, and you can even use a GPU backend for training neural nets, for example.

Obviously having some control over your runtime is necessary for many applications, but for the most common (e.g. quick and dirty exploratory analysis, testing a code chunk, doing a coding challenge, etc.) I find it easier to have that abstracted away. Indeed, the easier it is to get up and running the more likely I am to start a new project. Reducing the barrier to entry for data science projects like this might have profound impacts on the global propensity to do good data science. In a less idealistic and more realistic sense, this is a really cool tool I think everybody should have in their toolbox, and when time is of the essence (like it is during an election cycle) it might just be the best tool for the job.

You can also share your work so it can be peer reviewed (reminder to check out [my notebook](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt)), and extend each another's work with the click of a button. I understand that this is what GitHub promises, but I have found that while GitHub is good for Data Science workflows, it is not great for quick and dirty analyses that might become irrelevant during the next election cycle. Let's face it: we don't *always* need to spin up a Conda environment, run through the rigamarole of pull requests, and dammit if we didn't forget to pull the master before creating the branch we just spent days on and now there are conflicts.

I know this might get me crucified by the version control evangelists, and it's absolutely possible I'm wrong, but if we as a (Python) data science community have sort of come to a consensus on Jupyter as the almighty IDE then it's high time we started taking full advantage of it by using a platform built specifically for notebooks.
