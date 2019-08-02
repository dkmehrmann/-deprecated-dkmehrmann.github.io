---
layout: post
title: "The National Debt and its Derivatives"
author: "Andrew Mehrmann"
date: "July 29, 2019"
output: html_document
categories: election ds
---

*The [notebook for this analysis](https://colab.research.google.com/drive/14zIpFh00cR6n8BaOB-JxIFd3DRrpFeGZ) is available via Collaboratory. You can also create a copy or [run it yourself](https://stackoverflow.com/questions/52011084/what-is-playground-mode-in-googles-colaboratory)*
<hr>

I saw a Tweet (via Reddit) recently that caught my eye:

<br>

<center>
<blockquote class="twitter-tweet" data-lang="en">
<p lang="en" dir="ltr">
Reagan took the deficit from 70 billion to 175 billion.
Bush 41 took it to 300 billion.
Clinton got it to zero.
Bush 43 took it from 0 to 1.2 trillion.
Obama halved it to 600 billion.
Trump’s got it back to a trillion.

Morons: “Democrats cause deficits.”</p>&mdash; Alex Cole (@acnewsitics) <a href="https://twitter.com/acnewsitics/status/1153694545986621442?ref_src=twsrc%5Etfw">July 23, 2019</a></blockquote>
</center>

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br>

This astounded me. I fact checked him and...he’s right! For the most part, anyway.

Is it possible that there exists *clear evidence* of partisan effects on the Federal Budget Deficit? It turns out that the truth is not so simple. For one thing, the president doesn't have direct control over the Federal budget - that's Congress's job. Additionally, it's not exactly clear what taking spot checks of the deficit on the first and last days of a president's tenure really means. Nonetheless, I found the above claim compelling enough to warrant a more in-depth look at the relationship between political party and the budget deficit.

## Debt and its Derivatives

A debt, national or otherwise, accumulates as a result of a budget deficit. A deficit means you spent more than you took in, and you can either draw on your savings to pay for it or accumulate debt. Drawing on savings can work in the short-term, but once the savings dry up you've now got no emergency fund and the same budgetary problem you started with.

I’m not an expert on the nuanced costs and benefits of a government holding debt, but rather would like to start from the premise that a government consistently running over budget is not sustainable. If you don't believe me, it should be at least a little concerning that the Federal Government has set up [a website where you can donate to help pay down the national debt](https://www.pay.gov/public/form/start/23779454/).

We hear a lot about the growing National Debt, and there’s even a physical [“Debt Clock”](https://en.wikipedia.org/wiki/National_Debt_Clock) in New York City to highlight its alarmingly fast accrual.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/debt.png">
</p>

Not only is our debt increasing, but the rate at which it is increasing is increasing. This means that the deficit must be increasing year over year. In mathematical terms, you can think of the deficit as the *first derivative* of the debt, and the year over year change in deficit as the *second derivative* of the debt.

## Who can we Blame

What we all really want to know is *who can we blame all this debt on?* In the Tweet above, the author attributes *reducing the deficit* to Democratic presidents. Or rather, refutes the claim that Democrats *cause* the deficit. But how much can one administration or Congress really change these things, and how much of the issue is inherited from previous years? Debt is certainly inherited from administration to administration, but are deficits? Are changes in deficit?

Additionally, the president doesn’t have any direct control over the budget: that’s up to Congress to decide. It follows that to understand partisan effects on a federal budget, you need to include House and Senate control, and we need to look at debt and its first and second derivatives. In this analysis, I dig into these questions using data on the federal budget and party control of the House, Senate, and Presidency (see the [appendix](#appendix-the-data) for details).

## Digging into the Data

Before we start, I want to point out that it is not *just* party affiliation that controls how much deficit we run or debt we accumulate; it’s also economic conditions, warfare, etc., so it’s important to note that whatever these numbers say does not indicate a causal relationship. We can start by taking a look at the National Debt against who was in control of each body of government for the given Fiscal Year.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/debt_by_house.png">
</p>

Red and Blue indicate Republican and Democrat, respectively, keeping with convention. White bars indicate "split years", or years when power was being handed from one party to another.

Almost every year since 1970 has seen the National Debt increase. Such a monotonic pattern doesn't really tell us a good story, so let's look at the first derivative, the budget deficit/surplus over the same time period.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/deficit_by_house.png" width="600px">
</p>

On the left we're looking at deficit by fiscal year, so a high value means we added a lot to the debt and a low value means we added a little or subtracted from the debt. A flat line would mean we’re adding (or subtracting) the same amount to (or from) the debt every year. An increasing trend means we’re adding more to the debt over time, and decreasing the opposite.

On the right, I've added plotted the distribution (specifically a kernel estimate of it) of yearly deficits for Republicans and Democrats, ignoring split years. A distribution shifted to the right would indicated higher deficits for that respective party, while a wider distribution would indicate more variance in the size of the yearly deficit for that party.

Right away we see the deficit caused by the 08’-09’ financial crisis and subsequent stimulus package. Another thing to note is that the famous "Bill Clinton got the deficit to zero” thing happened with a largely Republican House/Senate.

Notice also how the line isn’t very “jagged,” meaning that the deficit in one period might be dependent at least in part on the deficit in the previous period. We’d call that “autocorrelated,” and we can check that deficits indeed are:

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/ac_deficit.png">
</p>

This means that in addition to debt being inherited year-over-year (this is true by definition), **deficits are also inhereted year-over-year**. For example, if we run a huge deficit in 2020, it’s likely there will be a large deficit in 2021 as well. Intuitively, the policies of your predecessors still have the be paid for regardless of if you like them or not, so they will be included in your budget (unless you repeal them which is usually tough).

Which brings us to the second derivative of the national debt: the change in budget deficit year over year. The reason this is important again is that both debt and deficits can be inherited, so statistics regarding how much debt or deficit a president or Congress ran will certainly be influenced by the previous administration. So what we're asking here is *how much did each administration change the deficit*. This gets closer to the heart of what we're asking: are Democrats or Republicans running up the bills that can't be paid?

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/change_deficit_by_house.png" width="600px">
</p>

So we’re getting out of the realm of interpretability here as we go deeper into the differentials, but a flat line would mean that the amount we’re increasing or decreasing the deficit year-over-year is the same. That’s about what we see, with it centered just above zero, meaning we’re sort of running a steadily increasing deficit with a few fluctuations here and there.

Unfortunately, **there doesn't appear to be a clear difference between Democrats and Republicans on this metric.** I say unfortunately because if you read this far you were probably hoping for something you could use against your political rivals in the future. No such luck.

For completeness, I also checked the autocorrelation between yearly changes in deficit and they indeed turn out to be uncorrelated, meaning these are probably *not* inherited over time. In other words, we've reached the end of the rabbit hole.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/ac_change_deficit.png">
</p>

While they are certainly dependent on lots of things, they’re apparently not dependent on how much you increased or decreased the deficit last year.

## Conclusions

The President's and Congress’s relationship to deficit through the federal budget is nuanced and attributing any causation would require a similarly sophisticated analysis. Nonetheless this observational analysis shows **no clear evidence that control over the presidency or either house of congress by either major political party has any correlation with the accumulation of national debt.** Furthermore, I’ve shown that **deficits are inherited year-over-year** so attributions of blame for debt accumulation should be at least partially based on the second-order figure *change in deficit* as opposed to debt accumulated or deficit registered.

## Appendix: The Data

I really really didn’t want to compile my own data to do this analysis, and luckily I found [Stephen Bloch’s webpage](http://goliards.us/adelphi/deficits/index.html) where he had done so already. He also has some similar analyses there, so I consider my work an extension of his. Obviously then my data is not from a primary source, but he was very transparent about [his methods and assumptions](http://goliards.us/adelphi/deficits/procedures.html) so for what it's worth I trust its accuracy.

I use only the last 50 years of data because party platforms change over time and it doesn’t make much sense to group 1920s Republicans together with the current GOP. 50 was chosen because it was nice and round, and I have not looked into whether or not the results shown here are stable with other choices of “lookback” time. The notebook is linked above, so I invite you to try it out!

On that note: while I was running through early iterations of this analysis I emailed Stephen some preliminary findings and, to my surprise, he emailed back! He asked (as he does on his page) about if there might be a relationship between both houses of Congress and possibly the presidency being held by the same party (which would mean lots of legislation could get passed) and the deficit. I have yet to perform that analysis, and I’ll join him in asking somebody to help us with it.
