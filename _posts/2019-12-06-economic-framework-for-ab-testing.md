---
layout: post
title: An Economic Framework for A/B Testing
author: "Andrew Mehrmann"
date: "December 04, 2019"
output: html_document
tags: programeval
---

---

This post is Part Three of a three-part series on Randomized Controlled Trials (RCTs) with an emphasis on A/B testing. Other articles in this series are []() and []().

---

It's easy to get on the A/B testing hype train, but the benefits are actually a bit more nuanced than they might seem. "Knowing what works" seems like a good idea, and indeed almost always is. Unfortunately, A/B testing only really tells us what works with any certainty if we have enough data. Gathering this data takes time, and money, and money in the form of time (opportunity cost).

## Benefits of Testing

The direct benefits of testing are strictly in terms of information gain. That is, a (Bayesian) test gives you a distribution of the expected effect of a proposed program, product, or policy. This only becomes valuable when it's used to make a decision.

### Reactive testing

Imagine there is some set of ideas that you plan to implement. Define $P( Q(\Delta))$ as the distribution of possible impacts of these ideas to your bottom line. Before running a test, you assume that a certain idea has an expected return according to this distribution. We center at zero in this illustration to propose that ideas are equally divided amongst good and bad.

![](/figs/2019-12-04-economic-framework-ab-tests/priordist.png)

Data from an RCT (or any other method) updates our beliefs about the efficacy of the idea. In the illustration below, data has shown largely positive effects, moving the posterior distribution to the right of center and shrinking the standard deviation.

![](/figs/2019-12-04-economic-framework-ab-tests/priorandpostdists.png)

The benefits from testing can be thought of as the difference between these distributions.

Further assume that your testing procedure perfectly eliminates the chances of implementing anything with negative impact, and doesn't eliminate anything with positive impact (we'll relax this assumption later). Your benefit of testing then is the avoided cost of every bad idea that you didn't roll out.


![](/figs/2019-12-04-economic-framework-ab-tests/priorandpostwithintegral.png)

You can then relax the assumption that testing results in perfect decisions, by adding a "test error" term that includes the effects of rolling out slightly bad ideas and not rolling out slightly good ones.

To be clear, we're making the assumption that the counterfactual to testing is that you'd simply implement the same set of ideas without checking them. In reality, testing allows you to try bolder ideas (proactive testing), so it actually widens the prior distribution as well.



## Costs of testing

## Putting it Together


## Conclusion

In sum, there is an opportunity cost to delaying good ideas from reaching 100% implementation, as well as rejecting good ideas that fail to meet (arbitrary) significance criteria.
