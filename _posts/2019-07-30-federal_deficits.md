---
layout: post
title: "The National Debt and its Derivatives"
author: "Andrew Mehrmann"
date: "July 29, 2019"
output: html_document
categories: election ds
---

<hr>
*The [notebook for this analysis](https://colab.research.google.com/drive/14zIpFh00cR6n8BaOB-JxIFd3DRrpFeGZ) is available via Collaboratory. You can also create a copy or [run it yourself](https://stackoverflow.com/questions/52011084/what-is-playground-mode-in-googles-colaboratory)*
<hr>

## Background

I saw a Tweet (via Reddit) recently that caught my eye:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Reagan took the deficit from 70 billion to 175 billion.
Bush 41 took it to 300 billion.
Clinton got it to zero.
Bush 43 took it from 0 to 1.2 trillion.
Obama halved it to 600 billion.
Trump’s got it back to a trillion.

Morons: “Democrats cause deficits.”</p>&mdash; Alex Cole (@acnewsitics) <a href="https://twitter.com/acnewsitics/status/1153694545986621442?ref_src=twsrc%5Etfw">July 23, 2019</a></blockquote>

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

This astounded me. I fact checked him and...he’s right! For the most part, anyway.

One thing I really liked about this tweet was that the author did not explicitly say that *Republicans* cause deficits, he was (I assume) pointing out the counter-evidence to claims that Democrats do so. Nevertheless, I recognize that his words could be interpreted as an attack the other way, so naturally I wanted to investigate further.

We hear a lot about the National Debt, and there’s even a physical [“Debt Clock”](https://en.wikipedia.org/wiki/National_Debt_Clock) in New York City to highlight this alarmingly high and growing number. I’m not interested here in debating the costs and benefits of a government holding debt (I’m not an expert on those subjects myself), but rather would like to level-set that a government consistently running over budget is not sustainable.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/debt.png">
</p>

At any rate, and in the spirit of the Tweet, I wanted to investigate partisan differences in the accumulation of the National Debt. Of course it is not *just* party affiliation that controls how much deficit we run; it’s also economic conditions, warfare, etc., so it’s important to note that whatever these numbers say does not indicate a causal relationship.

First I want to discuss what the different pieces of data mean, and why the above tweet is a great example of when nuanced choices in which data you choose to look at or present can change your conclusion (and often your argument if you’re not being a diligent scientist).

## Debt and its Derivatives

Imagine a country with a one-person government. Let’s say our hypothetical monarch inherits \\$1,000 in debt from her predecessor. If she runs that debt up to \\$1500 before she leaves office, some may say she did a bad job because she put the country in more debt, or that her policies were unsustainable because they required running a deficit to enact.

But what if she also inherited a deficit of \\$100/year too? Assuming she rules for 10 years and keeps the budget as is, the debt would have actually increased to \\$2000. What do you think about her budgetary policy now? In effect, she trimmed enough off the budget to save \\$500 in debt that otherwise would have been incurred.

It follows that we can’t just look at debt incurred, we also have to look at it’s derivatives: the budget deficit or surplus (first derivative), and the change in budget deficit or surplus each period (second derivative). In reality, that’s what our legislators have control over; the debt is sort of a byproduct of that.

Which brings me to another point: the president doesn’t have any *direct* control over the budget: that’s up to Congress to decide. It follows that to understand partisan effects on a federal budget, you need to include House and Senate control.

## Digging into the Data

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/debt_by_house.png">
</p>

Red and Blue indicate Republican and Democrat, respectively, keeping with convention. White bars indicate "split years", or years when power was being handed from one party to another.

This really doesn’t tell us that much, but it tells us a clearer story than “X President incurred this much debt” vs. “Y president incurred this much”. Like I pointed out above, these figures are largely dependent on the deficit a controlling body inherits. So let’s look at the first derivative, the budget deficit/surplus.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/deficit_by_house.png" width="600px">
</p>

On the left we're looking at deficit by fiscal year, so a high value means we added a lot to the debt and a low value means we added a little or subtracted from the debt. A flat line would mean we’re adding (or subtracting) the same amount to (or from) the debt every year. An increasing trend means we’re adding more to the debt over time, and decreasing the opposite.

On the right, I've plotted the distribution (specifically a kernel estimate of it) of yearly deficits for Republicans and Democrats, ignoring split years. A distribution shifted to the right would indicated higher deficits for that respective party, while a wider distribution would indicate more variance in the size of the yearly deficit for that party.

Right away we see the deficit caused by the 08’-09’ financial crisis and subsequent stimulus package. Another thing to note is that the famous "Bill Clinton got the deficit to zero” thing happened with a largely Republican House/Senate. Notice also how the line isn’t very “jagged,” meaning that the deficit in one period is dependent at least in part on the deficit in the previous period. We’d call that “autocorrelated,” and we can check that they indeed are:

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/ac_deficit.png">
</p>

So this checks out with my story above of debt *and* deficits being inherited from year-to-year. If we run a huge deficit in 2020, it’s likely there will be a large deficit in 2021 as well, for example. This is actually what I liked so much about the above Tweet: that the author went beyond the usual *debt* narrative and spoke to changes in *deficit.*

Which brings us to the second derivative of the national debt: the change in budget deficit year over year. The reason this is important again is that both debt and deficits can be inherited. Intuitively, the policies of your predecessors still have the be paid for regardless of if you like them or not, so they will be included in your budget (unless you repeal them which is usually tough). So what we really want to know is *how much did you change the deficit in your time*.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/change_deficit_by_house.png" width="600px">
</p>

So we’re again getting out of the realm of interpretability here as we go deeper into the differentials, but a flat line would mean that the amount we’re increasing or decreasing the deficit year-over-year is the same. That’s about what we see, with it centered around zero, meaning we’re sort of running a steady deficit (which is in turn adding to the debt).

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/ac_change_deficit.png">
</p>

The changes in deficit year-over-year are also seemingly uncorrelated with the previous changes in deficit, meaning these are probably *not* inherited over time. While they are certainly dependent on lots of things, they’re apparently not dependent on how much you increased or decreased the deficit last year.

## Conclusions

The President's and Congress’s relationship to deficit through the federal budget is nuanced and attributing any causation would require a similarly sophisticated analysis. Nonetheless this observational analysis shows no clear evidence that control over the presidency or either house of congress by either major political party has any correlation with the accumulation of national debt. Furthermore, I’ve shown that deficits are inherited year-over-year so attributions of blame for debt accumulation should be at least partially based on the second-order figure *change in deficit* as opposed to debt accumulated or deficit registered.

## Appendix: The Data

I really really didn’t want to compile my own data to do this analysis, and luckily I found [Stephen Bloch’s webpage](http://goliards.us/adelphi/deficits/index.html) where he had done so already. He also has some similar analyses there, so I consider my work an extension of his. Obviously then my data is not from a primary source, but he was very transparent about [his methods and assumptions](http://goliards.us/adelphi/deficits/procedures.html).

I use only the last 50 years of data because party platforms change over time and it doesn’t make much sense to group 1920s Republicans together with the current GOP. 50 was chosen because it was nice and round, and I have not looked into whether or not the results shown here are stable with other choices of “lookback” time. The notebook is linked above, so I invite you to try it out!

On that note: while I was running through early iterations of this analysis I emailed him some preliminary findings and, to my surprise, he emailed back! He asked (as he does on his page) about if there might be a relationship between both houses of Congress and possibly the presidency being held by the same party (which would mean lots of legislation could get passed) and the deficit. I have yet to perform that analysis, and I’ll join him in asking somebody to help us with it.
