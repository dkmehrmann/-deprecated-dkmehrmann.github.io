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

## Bayesian Testing

Bayesian analysis of A/B test results allows us to construct a posterior distribution for the difference between A and B. This is useful by itself because you can integrate the posterior from 0 to the right to determine the probability that B is better than A (assuming you constructed the posterior as $P(\mu_B - \mu_A)$. This probability can be used in cost benefit analyses to construct an expected value for each possible outcome - that is, we either roll out A or we roll out B.

$$\int_{0}^{\infty} P(\mu_B - \mu_A)$$

We can take this a step further by adding a loss or objective function to the posterior distribution. This allows us to express the posterior in terms of the bottom line, not some intermediate metric, which aren't always the same.[^3] This can be helpful when the bottom line is not symmetric around 0 impact, for example if small gains are worth risking large losses. If we set $\Delta = \mu_B - \mu_A$, and express our revenue gain as a function of $\Delta$ as $R$, our expected gain from rolling out B is

$$ \int_{\Delta} R(\Delta) P(\Delta) d\Delta$$

And if we write $R$ in terms of Dollars, we can even subtract the difference in cost (expressed as a function $C$) of a full scale implementation of B versus A. So here is our expected profit of rolling out B:

$$\int_{\Delta} R(\Delta) P(\Delta) d\Delta - [C(B) - C(A)]$$

But we can simplify by choosing a function $Q = R(\Delta) - [C(B) - C(A)]$ that represents *profit* of rolling out B, and write the expected profit as

$$\int_{\Delta} Q(\Delta) P(\Delta) d\Delta$$

I bet your P-values can't do that!

## Benefits of Testing

The direct benefits of testing are strictly in terms of information gain. That is, a (Bayesian) test gives you a distribution of the expected effect of a proposed program, product, or policy. This only becomes valuable when it's used to make a decision.

### Reactive testing

Imagine there is some set of ideas that you plan to implement. Define the "idea distribution" $P( Q(\Delta))$ as the distribution of possible impacts of these ideas to your bottom line. This is similar to the traditional Prior distribution from Bayesian inference, but instead of being chosen for mathematical convenience it is a true, unobservable distribution of possible outcomes.

Before running a test, you assume that a certain idea has an expected return according to this distribution. We center at zero in this illustration to propose that ideas are equally divided amongst good and bad.

![](/figs/2019-12-04-economic-framework-ab-tests/priordist.png)

Data from an RCT (or any other method) updates our beliefs about the efficacy of the idea. In the illustration below, data has shown largely positive effects, moving the posterior distribution to the right of center and shrinking the standard deviation.

![](/figs/2019-12-04-economic-framework-ab-tests/priorandpostdists.png)

The benefits from (reactive) testing can be thought of as the difference between these distributions. Intuitively, this corresponds to the difference in your knowledge of how effective an idea is before and after gathering data. RCTs are an efficient way of shrinking the variance of the posterior, but not the only way.

If the counterfactual is simply rolling out every idea without testing, then **reactive testing is really only valuable when it stops bad ideas** (good ideas would have rolled out anyway). The benefits of reactive testing then are the losses avoided from those bad ideas.

![](/figs/2019-12-04-economic-framework-ab-tests/priorandpostwithintegral.png)

If we define the prior profit distribution as $Pr(Q(\Delta))$ and the posterior as $Po(Q(\Delta))$, we can express this as

$$\int_{-\infty}^{0} Pr(Q(\Delta)) - Po(Q(\Delta)) d\Delta $$

If you totally nail your choice of prior, meaning that it exactly reflects the true idea distribution, you can write your expected loss aversion as

$$\int_{-\infty}^{0} \left[ P(\Delta) - \frac{P(D | \Delta) P(\Delta)}{P(D)} \right] Q(\Delta) d\Delta $$

or

$$\int_{-\infty}^{0} \left[ 1 - \frac{P(D | \Delta)}{P(D)} \right] P(\Delta)Q(\Delta) d\Delta $$

where $P(D)$ is an artifact of Bayes' Theorem that represents the unintuitive quantity "probability of the data." This mostly serves to ensure the posterior is a proper PDF (i.e. it integrates to 1).

To be clear, we're making the assumption that the counterfactual to testing is that you'd simply implement the same set of ideas without checking them. In reality, testing allows you to try bolder ideas (proactive testing), so it actually widens the idea distribution as well.

## Costs of testing

If the only way to benefit from reactive testing is by stopping bad ideas, that means we're applying testing to good ideas when we really don't need to be. Unfortunately we can't tell a priori which ideas and good and which are bad, so we end up with a tradeoff between delaying good ideas and stopping bad ones.

If our prior idea distribution is indeed centered at zero, it's obviously beneficial to temporarily delay good ideas at the cost of stopping the bad ones forever. If our idea distribution is shifted to the right (i.e. more good ideas than bad), however, the tradeoff becomes more tricky. The costs and benefits of testing then are a function of where that idea distribution is actually centered (how many bad ideas are we going to avoid), and how much opportunity cost there is to testing (how long our testing procedure takes).

Most people mistakenly assume that their idea distribution is very far to the right (i.e. that they have really good ideas).[^1] Consider the results of one of my favorite studies on this subject:

> QualPro has tested the real-world impact of over 150,000 business improvement ideas over the past three decades and discovered that most business ideas do not work. Our work with over 1,000 companies shows that no matter the source (executives, technical experts, front-line workers, customers, vendors, janitors) 75 percent of their ideas  will  not  improve  results,  and  nobody  can  accurately  predict which 25 percent are the most powerful ideas. Believe it or not, front-line  employees are just as likely as CEOs to suggest ideas that make measurable impacts on the bottom line.

\- *Holland and Cochrane, 2005*[^2]

The opportunity cost to delaying a truly good idea is the value of the idea over the test period times the sampling proportion of that arm of the test. For simplicity, assume all A/B tests are run with 50/50 splits. When an Idea is positive, the cost of the test is

$$C(Test | Idea, t) = \frac{1}{2} * Q(Idea) * t$$

and 0 otherwise. Using the $\Delta$ notation from before, a positive idea corresponds to $\Delta > 0$, so we can write in terms of $\Delta$ as such:

 $$C(Test | \Delta, t) = \frac{1}{2} * Q(\Delta) * t$$

This is nice but useless, because we don't know $\Delta$ before the experiment, so we can use our prior/posterior distribution framework from before.

 $$E(C(Test | t)) = \int_{0}^{\infty} \frac{1}{2} Pr(Q(\Delta)) t d\Delta$$

 So we can see that when $\Delta$ tends positive, our costs go up, and when it tends negative, they go down. When $t$ is long, costs also go up, but that story is a little more complicated.

## Putting it Together

The total value of testing can be expressed as

$$
E(Q(Testing) | t, Pr) =
\int_{-\infty}^{0} Pr(Q(\Delta)) - Po(Q(\Delta)) d\Delta -
\int_{0}^{\infty} \frac{1}{2} Pr(Q(\Delta)) t d\Delta
$$

So how to choose $t$? $t$ directly affects the variance of $Po(Q)$, so the formulation becomes a little complicated. Furthermore, it really doesn't matter, because this formula is based on the immeasurable Prior Distribution of ideas.


## Conclusion

In sum, there is an opportunity cost to delaying good ideas from reaching 100% implementation, as well as rejecting good ideas that fail to meet (arbitrary) significance criteria.

## Footnotes

[^3]: See [Goodhart's Law](https://en.wikipedia.org/wiki/Goodhart%27s_law)

[^1]: See Section 2 of  [this paper](https://exp-platform.com/Documents/2013%20controlledExperimentsAtScale.pdf) and Section 5.1 of [this paper](https://ai.stanford.edu/~ronnyk/ExPThinkWeek2009Public.pdf)

[^2]: Holland, C. W., & Cochran, D. (2005). Breakthrough Business Results With MVT: A Fast, Cost-Free, "Secret Weapon" for Boosting Sales,
Cutting Expenses, and Improving Any Business Process
