---
layout: post
title: "This Election, use your Data Skills for Good"
author: "Andrew Mehrmann"
date: "July 6, 2019"
output: html_document
category: ds
---

I try to stay as far away from "politics" as possible. Facts often go by the wayside and we're left bickering in circles about who's righteous and who's evil and chances are we all want the same things anyway so really what's the point. I'm not going to change your mind and you're not going to change mine because we have fundamentally different values. So let's just have a beer and do our disagreeing at the ballot box, right?

This line of thinking lets me sleep quite well at night, but it is critically flawed. There are injustices being done and to let them go unchecked is to disregard our civic responsibility. Inaction is a choice, and to choose not to stand up for what's right is worse than cowardly, it's wrong.

I'm of course talking about the misuse of data in political commentary. (really, guy, that's the injustice you're standing up for?)

How many times have you - as a data consumer, advocate, or professional - heard a pundit or correspondent say something regarding "statistics" or "margin of error" that made your skin crawl? Fallacies or misunderstandings are one thing, but even worse, data is often deliberately used to mislead. Examples abound but it is not the point of this article to reproduce them here.

Instead, I'd like to offer an antidote. Instead of engaging in a heated debate with a coworker over one too many happy hour pints, buy yourself a six-pack and head home to your computer (we all know the best-waged battles start at a keyboard). Do war with these people and don't let them get away with it. As experts, we have a duty to protect people from these practices of ignorance or malice.

If it hasn't become clear yet, my goal with this article is to *inspire* you to do something good with your skills. If punctuating my charge with over-the-top motivational language is what it takes then I'll gladly field the embarrassment of looking cheesy to do so.

It doesn't require a degree in Statistics or a public platform like a blog or website in order to serve the public interest (although those things help but only one of them is free). It just takes critical thinking, effort, and the desire to send a better-informed electorate to the ballot box in 2020.


## Analysis of the 2020 Democratic Primary Polls in Swing States

Keeping in spirit with the above, I created a simple analysis of polling data that answers a question voters seem to care about and that I haven't seen answered very well before: *if the Democrats want to beat Donald Trump, who should they choose as their candidate in the Primary?* I have seen lots of talk about an establishment Democrat (i.e. Joe Biden) having better chances than a more progressive candidate (e.g. Warren, Sanders), and indeed [this is an issue Democratic voters seem to care about](https://fivethirtyeight.com/features/democrats-care-more-about-winning-than-usual/).

To see which current Democratic contender has the best odds at beating Trump, one might be tempted to look at one of the numerous national-level polls that pit each candidate against the incumbent president. The problem with national-level polls is that they represent a sample statistic of *the popular vote*, and we saw *just last election* that winning the popular vote doesn't necessarily get you elected. It follows that to understand a candidate's chances of getting elected, you have to take the electoral college into account.

To do so, I used data from [FiveThirtyEight](https://data.fivethirtyeight.com/) to create an [Analysis of the 2020 Democratic Primary Polls in Swing States](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt). It isn't very technical and it didn't require a whole lot of time, but I had fun doing it and learning about Google Collaboratory (see [appendix](#appendix-tools) )while using data to answer a direct question I was interested in.

In my analysis, I report two things:

1. each serious Democratic candidate's polling average in each swing state and
2. a weighted average of those polls

Serious Democratic candidates are defined as Biden, Warren, Sanders, and Harris. Swing states are defined as IA, TX, OH, GA, NC, AZ, FL, WI, PA, MI, NH, MN, NV, ME, CO, VA, and NM. Here is the current (as of this writing) polling average for each candidate within each state:

<table border="1" class="table">  <thead>    <tr style="text-align: right;">      <th>state</th>      <th>eVotes</th>      <th>popvoteDem16</th>      <th>Biden</th>      <th>Warren</th>      <th>Sanders</th>      <th>Harris</th>    </tr>    </thead>  
<tbody>    
<tr>      <th>IA</th>      <td>6</td>      <td>0.449</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    
<tr>      <th>TX</th>      <td>38</td>      <td>0.453</td>      <td>0.522</td>      <td>0.495</td>      <td>0.484</td>      <td>0.478</td>    </tr>    <tr>      <th>OH</th>      <td>18</td>      <td>0.457</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>GA</th>      <td>16</td>      <td>0.473</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NC</th>      <td>15</td>      <td>0.481</td>      <td>0.509</td>      <td>0.498</td>      <td>0.525</td>      <td>0.491</td>    </tr>    <tr>      <th>AZ</th>      <td>11</td>      <td>0.481</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>FL</th>      <td>29</td>      <td>0.494</td>      <td>0.513</td>      <td>0.503</td>      <td>0.512</td>      <td>0.491</td>    </tr>    <tr>      <th>WI</th>      <td>10</td>      <td>0.496</td>      <td>0.535</td>      <td>0.500</td>      <td>0.540</td>      <td>NaN</td>    </tr>    <tr>      <th>PA</th>      <td>20</td>      <td>0.496</td>      <td>0.539</td>      <td>0.485</td>      <td>0.517</td>      <td>0.500</td>    </tr>    <tr>      <th>MI</th>      <td>16</td>      <td>0.499</td>      <td>0.545</td>      <td>0.507</td>      <td>0.532</td>      <td>0.518</td>    </tr>    <tr>      <th>NH</th>      <td>4</td>      <td>0.502</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>MN</th>      <td>10</td>      <td>0.508</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NV</th>      <td>6</td>      <td>0.513</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>ME</th>      <td>4</td>      <td>0.516</td>      <td>0.540</td>      <td>0.520</td>      <td>0.530</td>      <td>0.520</td>    </tr>    <tr>      <th>CO</th>      <td>9</td>      <td>0.527</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>VA</th>      <td>13</td>      <td>0.528</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>    <tr>      <th>NM</th>      <td>5</td>      <td>0.547</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>      <td>NaN</td>    </tr>  </tbody></table>

Cells with `NaN` represent state-candidate combinations for which there are no polls (within the last 8 weeks).

And then the polling averages, weighted by each state's number of electoral votes, imputing each candidate's national polling average for the states with no polls:

![center](/figs/2019-07-06-swing_states/polling_avg_trump.png)

Given the above, I conclude that **national numbers reflect more support for the Democratic challenger than polls in the swing states.** This is in line with the outcome from last election where the Democratic candidate won the popular vote but lost big where it mattered: in the swing states.

The astute observer might observe that a weighted average of polls over a group of states is *the exact thing* I'm hoping to avoid by creating this analysis. Namely, you could still get into a situation where a candidate wins the popular vote across those swing states but receives less electoral college votes than their competitor. That criticism is certainly valid, but I think the average of polls in swing states is still a more valuable figure than what is reported by national polls. At the very least, it probably reduces whatever bias is resulting in the discrepancy between electoral college and popular vote.

Remember that the point was to inform Democratic Primary voters about each candidate's "electability" in a more nuanced way than what is reported in national polls. A notion of electability may entice us to vote for a candidate based on their ability to win rather than our agreement with their views. This isn't inherently wrong - it's just game theoretically rational - but it can be damaging to certain types of candidates, [especially minorities and women](https://www.avalanchestrategy.com/electability). Regardless of your opinion on who is best suited to serve as president, it is important that we don't rely on skewed data inform our ideas of who is electable.

## Possible Use Cases for Voters

Underlying this whole thing is the concept of [tactical voting](https://en.wikipedia.org/wiki/Tactical_voting), which basically states that voters may not (or should not) vote for their *sincere preference* when there is rational reason to vote some other way (and there are several, like voting for Biden to ensure Trump is beaten). In other words, each voter would select the candidate that maximizes utility, with each candidates expected utility given as the product of their probability of winning and the utility that voter gains by the candidate becoming president. Or something like that.

The point is that each candidate's chances of wining the general election should play a huge part in who a voter choses in the primaries. Since data works best if you ask it specific questions, we might reformulate our inquiry as something like *how likely is each candidate to beat Trump in the General Election*. Answering such a question would require a much more nuanced analysis, but at least the polling numbers in this analysis provide a slightly clearer insight into the answer than national polls do.

We can also investigate the rank ordering of each candidate based on their likelihood to beat Trump and compare the national numbers to just those in the swing states. Ignoring the aforementioned risks of taking an average over states, it turns out that as it currently stands the national polls suggest the same order as the polls within the swing states. In other words, the national polls pick the same winner (and second, third, and forth place) as the polls in the swing states. It will be interesting to see if those orderings change as more polls come in (which would imply national polls might be misleading voters).

*NB: Although my notebook looks really fancy with the Python code and statistical language, an analysis is only as good as the data it's built on and mine isn't built on much. It's more of an exposition and possible starting point for others to explore their curiosities.*

## Conclusion

To me, politics can be fun and interesting and it's not as hard as you think to do something useful with some open data and a little patience. You don't have to throw a Neural Net at every problem to be valuable (although I'd love to see a NN take on FiveThirtyEight's model).

Political campaigns are our time to shine, where people say things like "statistical significance" on national television! Instead of vilifying those who wield statistics incorrectly or provoking our friends into an argument over minimum wage, let's do something productive with that superiority complex that's all too common of us people "in the know": let's dig into the data and see what we can find out.

To me, Collaboratory is a great tool for this. It is extremely easy to perform quick analyses because we don't have to set up a compute environment on our machines. We can share our work so it can be peer reviewed (reminder to check out [my notebook](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt)), and extend each others' work with the click of a button.

I understand that this is what GitHub promises, but I have found that while GitHub is good for Data Science workflows, it is not great for quick and dirty analyses that might become irrelevant during the next election cycle. Let's face it: we don't *always* need to spin up a Conda environment, run through the rigamarole of pull requests, and dammit if we didn't forget to pull the master before creating the branch we just spent days on and now there are conflicts.

I know this might get me crucified by the version control evangelists, and it's absolutely possible I'm wrong, but if we as a community have sort of come to a consensus on Jupyter as the almighty IDE then it's high time we started taking full advantage of it by using a platform built specifically for notebooks.

Of course it is unlikely someone like me or perhaps yourself without a platform or online following will have much impact on the outcome of this election, or the way we as an open source data science community analyze political data. But I believe it is our civic duty - just like voting - to contribute to it in a responsible and ethical manner in the most effective way we know how, and it probably looks something like `import pandas as pd`.


## Appendix: Tools

If you're digging what I've said so far, maybe know a bit of Python, and aren't exactly an expert on politics or analyzing political data (call it politicurious, maybe?), I'd like to turn your attention to three specific things I think can help turn your newfound energy into a productive coding session.

### Free, Open Political Data

There is a wealth of open data on politics if you know where to look. For example, this [fantastic and thorough blog post](https://medium.com/ndp-annotations/civic-and-political-apis-data-sets-and-websites-136fa63a0af1) lists several of them.

I'd also like to mention a couple more (some of which are in the previous article):

* [voteview](https://voteview.com/data)
* [OpenSecrets](https://www.opensecrets.org/open-data)

(give a blurb about each)


I usually prefer APIs to flat data sets because updating an analysis becomes as easy as rerunning the code (instead of redownloading the dataset first).

Standing an app on top of data science analyses is not trivial, and most of the time I prefer to skip that step and simply use a notebook instead. Which brings me to my next point...


### Google Collaboratory

[Google Collaboratory](https://colab.research.google.com/) is a space for you to host and run Jupyter notebooks. If you have a Google account (like most of us do) it is free to use and you'll be up and running in seconds. Gone are the days of installing Anaconda, configuring Jupyter, forgetting your password, looking up how to reset the password, installing packages, and having your session die when you accidentally close your laptop. What's especially exciting is that these notebooks are hosted and run in their own cloud-based runtime, and you can even use a GPU backend for training neural nets, for example.