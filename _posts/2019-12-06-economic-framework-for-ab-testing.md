---
layout: post
title: An Economic Framework for A/B Testing
author: "Andrew Mehrmann"
date: "January 11, 2020"
output: html_document
tags: causal
---

This post is Part Three of a three-part series on Randomized Controlled Trials (RCTs) with an emphasis on A/B testing. Other articles in this series are [Rethinking A/B Testing](/2020/01/09/rethinking-ab-testing.html) and [A/B Tests that Make Sense](/2020/01/10/ab-tests-make-sense.html).

---

It's easy to get on the A/B testing hype train, but the benefits are actually a bit more nuanced than they might seem. "Knowing what works" seems like a good idea, and indeed almost always is. Unfortunately, A/B testing only really tells us what works with any certainty if we have enough data. Gathering this data takes time, and money, and money in the form of time (opportunity cost).

In the previous two articles, I've argued that A/B tests have nuanced costs and benefits, and that a Bayesian framework shows a lot of promise towards increasing their benefits. In this post, I'll attempt to bring everything together to suggest a cost/benefit framework for thinking about A/B testing. Because this framework requires thinking in Bayesian terms (e.g. priors and posteriors), I'll assume that all A/B tests are run using a Bayesian Framework. This doesn't have to be the case, but the assumption greatly simplifies my argument and allows it to be expressed in elementary calculus.

## Bayesian Testing

Bayesian analysis of A/B test results allows us to construct a posterior distribution for the difference between A and B, $P(\mu_B - \mu_A \| D)$. Rewriting $\Delta = \mu_B - \mu_A$ gives our posterior distribution $P(\Delta \| D)$. This is useful by itself because you can integrate the posterior from 0 to the right to determine the probability that B is better than A (or $\Delta > 0$).

$$\int_{0}^{\infty} P(\Delta | D) d\Delta$$

We can take this a step further by adding a loss or objective function to the posterior distribution to construct an expected value for each possible outcome - that is, we either roll out A or we roll out B. In so doing, we express the posterior in terms of the bottom line as opposed to some intermediate metric.[^3] This can be helpful when the bottom line is not symmetric around 0, for example if gains increase quickly while losses increase slowly. If we set our revenue gain $R$ as a function of $\Delta$, our expected gain from rolling out B is

$$\int_{\Delta} R(\Delta) P(\Delta | D) d\Delta$$

And if we write $R$ in terms of Dollars, we can even subtract the difference in cost (expressed as a function $C$) of a full scale implementation of B versus A. So here is our expected profit of rolling out B:

$$\int_{\Delta} R(\Delta) P(\Delta | D) d\Delta - [C(B) - C(A)]$$

But we can simplify by choosing a function $Q = R(\Delta) - [C(B) - C(A)]$ that represents *profit* of rolling out B, and write the expected profit as

$$\int_{\Delta} Q(\Delta) P(\Delta | D) d\Delta$$

I bet your P-values can't do that!

## Benefits of Testing

The direct benefits of testing can be expressed in terms of information gain. That is, a (Bayesian) test gives you a distribution of the expected effect of a proposed program, product, or policy. In my view, this only becomes valuable when it's used to make a decision. Therefore, we can think of the benefits of testing as the differences between the decisions that *would have been made* without testing and the decisions that are made based on tests.

If you've been following closely, this only represents the benefits of what I called "reactive testing," or tests that are run to check efficacy of a program or product, but not "proactive testing," or new ideas that wouldn't have been tried without the guardrails of testing. This means that the following framework probably represents a *lower bound* for testing benefit. But I digress...

Imagine there is some set of ideas that you plan to implement. Define the "idea distribution" $P( Q(\Delta))$ as the distribution of possible impacts of these ideas to your bottom line. This is similar to the traditional Prior distribution from Bayesian inference, but instead of being chosen for mathematical convenience it is a true, unobservable distribution of possible outcomes.

Before running a test, you assume that a certain idea has an expected return according to this distribution. We center at zero in this illustration to propose that ideas are equally divided amongst good and bad.

![](/figs/2019-12-04-economic-framework-ab-tests/priordist.png)

Data from an RCT (or any other method) updates our beliefs about the efficacy of the idea. In the illustration below, data has shown largely positive effects, moving the posterior distribution to the right of center and shrinking the standard deviation.

![](/figs/2019-12-04-economic-framework-ab-tests/priorandpostdists.png)

A helpful way to think about this is that the idea distribution represents the ideas that would be implemented in a world *without* testing, and the posterior distribution represents the ideas that will be implemented in this new worth *with* testing. Sometimes we'll still implement an idea that is slightly to the left of 0 because of measurement or sampling error, but in general we only implement the good ideas.

The benefits from (reactive) testing can be thought of as the difference between these distributions. Intuitively, this corresponds to **the difference in your knowledge of how effective ideas are before and after gathering data.** It's important to point out that RCTs are an efficient way of shrinking the variance of the posterior, but not the only way; there are also econometric or quasi-experimental techniques that may be sufficient or convenient to use instead.

Another way to think about this: if the counterfactual is simply rolling out every idea without testing, then **reactive testing is really only valuable when it stops bad ideas** (good ideas would have rolled out anyway). The benefits of reactive testing then are the losses avoided from those bad ideas.

![](/figs/2019-12-04-economic-framework-ab-tests/priorandpostwithintegral.png)

If we define the prior profit distribution as $P(Q(\Delta))$ and the posterior as $P(Q(\Delta) \| D)$, we can express this as

$$\int_{-\infty}^{0} P(Q(\Delta)) - P(Q(\Delta) | D) d\Delta $$

If you totally nail your choice of prior, meaning that it exactly reflects the true idea distribution, we can substitute $P(Q(\Delta) \| D)$ using Bayes' Theorem and factor out $Q(\Delta)$ to write the expected loss aversion as

$$\int_{-\infty}^{0} \left[ P(\Delta) - \frac{P(D | \Delta) P(\Delta)}{P(D)} \right] Q(\Delta) d\Delta $$

or

$$\int_{-\infty}^{0} \left[ 1 - \frac{P(D | \Delta)}{P(D)} \right] P(\Delta)Q(\Delta) d\Delta $$

where $P(D)$ is an artifact of Bayes' Theorem that represents the unintuitive quantity "probability of the data." This mostly serves to ensure the posterior is a proper PDF (i.e. it integrates to 1), and is often ignored during calculation and backed out later. This equation isn't super useful (read: practically useless) on its own, but captures the notion of where the value of A/B testing lies: between the prior and the posterior to the left of 0 in terms of profit.

To be clear, we're making the assumption that the counterfactual to testing is that you'd simply implement your original set of ideas. In reality, testing allows you to try bolder ideas (proactive testing), so it actually widens the idea distribution as well. As mentioned before, this probably represents a lower bound to the benefits of testing.

## Costs of testing

If the only way to benefit from reactive testing is by stopping bad ideas, that means we're applying testing to good ideas when we really don't need to be. Unfortunately we can't tell a priori which ideas and good and which are bad, so we end up with a tradeoff between delaying good ideas and stopping bad ones.

If our prior idea distribution is indeed centered at zero, it's obviously beneficial to temporarily delay good ideas at the cost of stopping the bad ones forever. If our idea distribution is shifted to the right (i.e. more good ideas than bad), however, the tradeoff becomes more tricky. The costs and benefits of testing then are a function of where that idea distribution is actually centered (how many bad ideas are we going to avoid), and how much opportunity cost there is to testing (how long our testing procedure takes).

Most people mistakenly assume that their idea distribution is very far to the right (i.e. that they have really good ideas).[^1] Consider the results of one of my favorite studies on this subject:

> QualPro has tested the real-world impact of over 150,000 business improvement ideas over the past three decades and discovered that most business ideas do not work. Our work with over 1,000 companies shows that no matter the source (executives, technical experts, front-line workers, customers, vendors, janitors) 75 percent of their ideas  will  not  improve  results,  and  nobody  can  accurately  predict which 25 percent are the most powerful ideas. Believe it or not, front-line  employees are just as likely as CEOs to suggest ideas that make measurable impacts on the bottom line.

\- *Holland and Cochrane, 2005*[^2]

One of the fundamental assumptions of a testing program is that our ideas are not as good as we'd like to believe they are, and the study above gives some pretty damning evidence in favor of that assumption. This means that our idea distribution is probably centered close to 0, and that testing provides some obvious benefits. To formally quantify this, we need to weigh opportunity cost of testing good ideas against the prevention of bad ideas.

The opportunity cost to delaying a truly good idea is the value of the idea over the test period times the sampling proportion of that arm of the test. For simplicity, assume all A/B tests are run with 50/50 splits. Using the $\Delta$ notation from before, a positive idea corresponds to $\Delta > 0$, and the cost of the test is

$$C(Test | Idea, t) = \frac{1}{2} * Q(Idea) * t$$

This is nice but useless, because we don't know $\Delta$ before the experiment, so we can substitute in our prior/posterior distribution framework from before.

 $$E(C(Test | t)) = \int_{0}^{\infty} \frac{1}{2} P(Q(\Delta)) t d\Delta$$

 So we can see that when $\Delta$ tends positive, our costs go up, and when it tends negative, they go down. When $t$ is large, costs also go up, but that story is a little more complicated because $t$ is directly related to the variance of the posterior distribution, so it will also correspond to increased benefits.

## Putting it Together

In my view, the total value of testing can be expressed as

$$
E(Q(Testing) | t, P, D) =
\int_{-\infty}^{0} P(Q(\Delta)) - P(Q(\Delta) | D) d\Delta -
\int_{0}^{\infty} \frac{1}{2} P(Q(\Delta) | D) \text{ t } d\Delta
$$

Doing some sanity checks, we notice that our value of testing goes up when our idea distribution $P(Q(\Delta))$ shifts to the left (so that more of its density is left of 0). This corresponds to our earlier intuition that testing is valuable when it stops bad ideas. We also notice that the value of testing is 0 when $t = 0$, which implies $P(Q) = P(Q \| D)$ because there is no Data, and both integrals equate to 0.

So barring any serious mistakes, we have a (somewhat unwieldy) formula for the value of Bayesian A/B testing. One question we might as is how to maximize this formula? Our inputs are $t$, $P$, and $D$. We have no control over $P$ or $D$ (except through $t$), so the only lever we can pull is $t$, or how long to run each test.

When $P(Q \| D)$ is centered to the right of 0, we can see that the cost side of the equation will increase with $t$, both from $t$ directly and from the variance of $P(Q \| D)$ shrinking, implying more of the mass is moving right of 0. On the other hand, $P(Q \| D)$ slipping to the right of 0 will increase our benefits as well.

<div class="row">
  <div class="column" style="width: 50%; float: left;">
    <img src="/figs/2019-12-04-economic-framework-ab-tests/costandloss_highsd.png" style="width:100%">
  </div>
  <div class="column" style="width: 50%; float: left;">
    <img src="/figs/2019-12-04-economic-framework-ab-tests/costandloss_lowsd.png" style="width:100%">
  </div>
</div>

Remember that $P(Q \| D)$ will never practically exist on the left size of 0, because that would imply your testing program exists to stop good ideas!

Translating $t$ to variance requires loads more assumptions, so I think the analytic buck stops here. That this analysis came down to a struggle between sample size and variance should be nothing new, but perhaps this revealed a new path to get there.


## Conclusions

The primary benefit of A/B testing is stopping bad ideas from doing harm in business, policy, philanthropy, or other important arenas. On the other hand, there is an opportunity cost to delaying good ideas from reaching 100% implementation, as well as rejecting good ideas that fail to meet significance criteria.

I believe significance criteria should be chosen to maximize a value equation like the one above considering the appropriate costs and benefits, rather than based on archaic rules of thumb (looking at you, p-values). This allows for optimizing for the end goal directly, rather than for some intermediate metric that might not always translate to the bottom line.

In this post I outlined one framework for the costs and benefits of A/B testing. Future work should include working out some examples to see how typical significance thresholds compare to one that maximizes the value equation above under different distributional assumptions, as well as developing alternative cost/benefit frameworks. If the end goal of A/B testing is to maximize impact, it makes sense to tailor the tools to the ends.

<ul class="pager">
  <li class="previous"><a href="/2020/01/10/ab-tests-make-sense.html">Prev: A/B Tests that Make Sense</a></li>
  <li class="next disabled"><a href="#">Next: </a></li>
</ul>

## Footnotes

[^3]: See [Goodhart's Law](https://en.wikipedia.org/wiki/Goodhart%27s_law)

[^1]: See Section 2 of  [this paper](https://exp-platform.com/Documents/2013%20controlledExperimentsAtScale.pdf) and Section 5.1 of [this paper](https://ai.stanford.edu/~ronnyk/ExPThinkWeek2009Public.pdf)

[^2]: Holland, C. W., & Cochran, D. (2005). Breakthrough Business Results With MVT: A Fast, Cost-Free, "Secret Weapon" for Boosting Sales,
Cutting Expenses, and Improving Any Business Process
