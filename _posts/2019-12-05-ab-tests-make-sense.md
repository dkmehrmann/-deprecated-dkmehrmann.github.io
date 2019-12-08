---
layout: post
title: A/B Tests that Make Sense
author: "Andrew Mehrmann"
date: "December 04, 2019"
output: html_document
tags: programeval
---

---

This post is Part Two of a three-part series on Randomized Controlled Trials (RCTs) with an emphasis on A/B testing. Other articles in this series are []() and []().

*This is a less technical version of the argument outlined in [this whitepaper by Chris Stucchio](https://cdn2.hubspot.net/hubfs/310840/VWO_SmartStats_technical_whitepaper.pdf). I use slightly different notation, but the ideas are mostly the same.*

---

If your job or hobby involves relating statistical results to people with less than a graduate degree in statistics, this post is for you. What if I told you you'd never have to explain a p-value again? If you're in the business of A/B testing: what if I told you you didn't have to say "no" when somebody asks you "what's the probability that the new is better than the old thing?" Maybe you're not ready to drink the Kool-Aid, but are you at least curious about the flavor?

Yes, this is a Bayesian puff piece. But before you go, let me assure you there isn't a single mathematical equation in what follows; you won't even see the famous theorem. If it was a tour of New York it wouldn't even stop at Times Square. No, this post is merely a correction to 2 years of running A/B tests the wrong way.

Here's a spoiler: the problems arising from sensitivity to priors are far, far smaller than the problems arising from unintuitive results in practical settings. I don't argue this point mathematically, but rather rhetorically outline some of the benefits of a Bayesian approach to A/B testing. Of course, your mileage may vary, and my perspective is largely a response to frustrations arising from trying to jam frequentist statistics sideways into business workflows.

## A Better Way

What frequentist A/B testing intentionally leaves out is context. I recommend a Bayesian framework to A/B testing that includes relevant context such as the decision being made and the environment it’s being made in. In the traditional Bayesian sense, this might also mean including human or empirical expectations for the outcome of the experiment being conducted in the form of a prior.

Critics argue that this makes the analysis subjective, and I would counter with two points: 1) it should be subjective, and 2) it is no more subjective than the statistical significance threshold of p=0.05. To be fair, the danger of human bias may be far greater in certain academic disciplines where frequentist A/B testing is still the norm. This is not to imply that A/B testing is not serious business outside of academia, rather it is an attempt to shape the statistical methodology to the context in which it is applied. This has several practical benefits, some of which are mathematical and some of which are cultural.

## Mathematical Benefits

Bayesian analysis of A/B test results allows us to construct a posterior distribution for the difference between A and B. This is useful by itself because you can integrate the posterior from 0 to the right to determine the probability that B is better than A (assuming you constructed the posterior as $P(\mu_B - \mu_A)$. This probability can be used in cost benefit analyses to construct an expected value for each possible outcome - that is, we either roll out A or we roll out B.

$$\int_{0}^{\infty} P(\mu_B - \mu_A)$$

We can take this a step further by adding a loss or objective function to the posterior distribution. This allows us to express the posterior in terms of the bottom line, not some intermediate metric, which aren't always the same. This can be helpful when the bottom line is not symmetric around 0 impact, for example if small gains are worth risking large losses. If we set $\Delta = \mu_B - \mu_A$, and express our revenue gain as a function of $\Delta$ as $Q$, our expected gain from rolling out B is

$$ \int_{\Delta} Q(\Delta) P(\Delta) d\Delta$$

And if we write $Q$ in terms of Dollars, we can even subtract the difference in cost (expressed as a function $C$) of a full scale implementation of B versus A. So here is our expected profit of rolling out B:

$$\int_{\Delta} Q(\Delta) P(\Delta) d\Delta - [C(B) - C(A)]$$

I bet your P-values can't do that!

## Cultural Benefits

I haven't discussed in detail the process of constructing $P(\Delta)$, but one important step is choosing a "prior distribution" on $\Delta$. This is basically your belief - before the experiment runs - of what values $\Delta$ might take. Subject matter experts may be consulted during this phase, and their opinion incorporated in the form of this prior distribution. Having a good idea of what $\Delta$ might be before the test can lead to shorter test times, but it also allows stakeholders to feel more comfortable about the testing procedure. Like it or not, data from an experiment is going to be weighed against stakeholders' preconceived notions, and the Bayesian framework gives a convenient way to express that relationship mathematically.

Another major benefit of these mathematical changes is that they express test results in terms that human beings are familiar with. For example, you can make statements of the probability that the new product will make money, or the expected return of the new project. I hypothesize that this will lead to better adoption of testing practices, but I haven't verified with my own experience.

On the other hand, your mileage may vary. The choice of prior might be just as confusing to stakeholders as explaining a p-value or choosing a minimum detectable effect. If this should be the case, practitioners should go back to the drawing board and establish a testing framework that works for everyone. Remember to optimize towards better decision making, not a particular method for accomplishing that end. These mathematical changes are only beneficial insofar as they lead to real change within the organization.

## Conclusions

Mathematically, a Bayesian approach to A/B testing allows us to make inferences on the probability that A is better than B or vice versa. It also allows us to construct a distribution of the possible values for the difference between A and B. Furthermore, by mapping this probability distribution to a profit/revenue space, this allows us to make inferences in terms of dollars, e.g. “what is the probability that A will generate more than $1000 additional revenue?” or “what is the probability that B is profitable?”

Culturally, by including context in statistical analyses, human experts become first-class citizens and empirical analyses become more accessible. A priori assumptions are framed in terms of "what do you expect to see" rather than "what is the smallest effect that you wish to be able to detect," while results are expressed in language that stakeholders expect and desire to see. Furthermore, keeping the bottom line (e.g. profits or lives saved) as the focus of the test will guide decision makers to optimize for those things directly rather than maximizing short-term incentives.
