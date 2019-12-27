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

If your job or hobby involves relating statistical results to people with less than (or equal to) a graduate degree in statistics, this post is for you. What if I told you you'd never have to explain a p-value again? If you're in the business of A/B testing: what if I told you you didn't have to say "no" when somebody asks you "what's the probability that the new is better than the old thing?" Maybe you're not ready to drink the Kool-Aid, but are you at least curious about the flavor?

Here's my basic thesis: expressing experimental results in terms of a posterior distribution on the parameter of interest is an extremely appealing feature of Bayesian statistics. Further, the problems arising from sensitivity to Bayesian priors are far, far smaller than the problems arising from unintuitive results from frequentist hypothesis tests in practical settings. I  argue rhetorically rather than mathematically in what follows, and in so doing outline some of the benefits of a Bayesian approach to A/B testing. Of course, your mileage may vary, and my perspective is largely a response to frustrations arising from trying to jam frequentist statistics sideways into business workflows.

## Frequentist vs. Bayesian

Imagine we wish to run an A/B test to estimate $\Delta$, or the difference in terms of some parameter between the A and B arms of the test. If it helps, say A and B are different versions of a webpage, and $\Delta$ is the difference in clickthrough rate (CTR), but the details of A, B, and $\Delta$ are unimportant for what follows.

A frequentist A/B test would estimate $\hat{\Delta}$ and compare it to a "null distribution," or what you'd expect to observe under the "null hypothesis" that $\Delta = 0$. If $\hat{\Delta}$ was unlikely under the null hypothesis - say the probability of observing $\hat{\Delta}$ or a value more extreme was less than 5% - we'd "reject the null" and conclude that A and B were "significantly" (as in statistically) different. Specifically, the observed differences between A and B were unlikely to be due to chance alone.

A Bayesian A/B test would estimate $P(\Delta \| D)$, where D represents the data, based on the following equation:

$$P(\Delta | D) = \frac{P(D | \Delta)P(\Delta)}{P(D)}$$

which is usually written as

$$P(\Delta | D) \propto P(D | \Delta)P(\Delta)$$

where $\propto$ means "is proportional to." $P(\Delta \| D)$ is what we want, and is the **posterior** distribution of $\Delta$ given the data we've observed. To get that, we need two things: the **likelihood** of the data given $\Delta$, and a **prior** distribution on $\Delta$.

I won't go into the details of how these tests are solved (there are plenty of other resources out there), but I want to highlight the key differences between frequentist and Bayesian tests because these differences form the basis for the rest of my argument. For that reason, it's worth pointing them out explicitly:

**Difference 1:** *Bayesian analysis requires choice of a prior distribution*

**Difference 2:** *Bayesian analysis produces a posterior distribution on the parameter of interest, whereas frequentist analysis produces a p-value representing the probability of observing what you did assuming a certain statistical model (in practice, one in which there is no difference between A and B)*

## Choosing Priors

Frequentist hypothesis (including A/B) tests are intentionally devoid of context. This means that they make no distinction between testing for a relationship between genes and IQ or jeans and IQ[^1]. One could argue that a researcher should screen for uninformative tests up front, but the mathematical framework has no way of accounting for it, and in practice this screening takes place less than you'd think.

One important step of Bayesian analysis is choosing a "prior distribution" on $\Delta$. This is basically your belief - before the experiment runs - of what values $\Delta$ might take. Subject matter experts may be consulted during this phase, and their opinion incorporated in the form of this prior distribution. Having a good idea of what $\Delta$ might be before the test can lead to shorter test times, but it also allows stakeholders to feel more comfortable about the testing procedure. Like it or not, data from an experiment is going to be weighed against stakeholders' preconceived notions, and the Bayesian framework gives a convenient way to express that relationship mathematically.

Bayesian statistics doesn't solve all of these problems, but they do - in my opinion - move us in the right direction. For one, they include relevant context such as the decision being made and the environment it’s being made in. In the traditional Bayesian sense, this might also mean including human or empirical expectations for the outcome of the experiment being conducted in the form of a prior. Critics argue that this makes the analysis subjective, and I would counter with two points: 1) it should be subjective, and 2) it is no more subjective than the statistical significance threshold of p=0.05.

## No More P-Values

Furthermore, a significance test by definition informs a binary decision between "significant" and "not significant". This discretization of a continuous value is a mistake I see and make so often I'm starting to wonder if it isn't a named cognitive bias. Nevertheless, it leads to all sorts of problems, including the censoring of scientific research that might be just on the other side of a significance criterion, as well as misleading the public that "statistically significant" means anything of real importance.

Additionally, the product of a Bayesian test is a "posterior distribution," or a direct representation of the possible values your parameter (e.g. the difference between A and B) might take and their associated probabilities. This is pretty much always desirable over p-values or confidence intervals, which only give indirect information about the parameter of interest (e.g. here are the possible values of the parameter vs. here are the possible values of the population parameter for which the observed values of that parameter aren't extremely unlikely).

To be fair, frequentist tests aren't as inherently flawed as their realizations make them out to be - they are simply more prone to abuse. Also, the danger of human bias and subjectivity of priors may be far greater in certain academic disciplines where frequentist A/B testing is still the norm. This is not to imply that A/B testing is not serious business outside of academia, rather it is an attempt to shape the statistical methodology to the context in which it is applied.

## Conclusions

Mathematically, a Bayesian approach to A/B testing allows us to make inferences on the probability that A is better than B or vice versa. It also allows us to construct a distribution of the possible values for the difference between A and B. Furthermore, by mapping this probability distribution to a profit/revenue space, this allows us to make inferences in terms of dollars, e.g. “what is the probability that A will generate more than $1000 additional revenue?” or “what is the probability that B is profitable?”

Culturally, by including context in statistical analyses, human experts become first-class citizens and empirical analyses become more accessible. A priori assumptions are framed in terms of "what do you expect to see" rather than "what is the smallest effect that you wish to be able to detect," while results are expressed in language that stakeholders expect and desire to see. Furthermore, keeping the bottom line (e.g. profits or lives saved) as the focus of the test will guide decision makers to optimize for those things directly rather than maximizing short-term incentives.

On the other hand, your mileage may vary. The choice of prior might be just as confusing to stakeholders as explaining a p-value or choosing a minimum detectable effect. If this should be the case, practitioners should go back to the drawing board and establish a testing framework that works for everyone. Remember to optimize towards better decision making, not a particular method for accomplishing that end. These mathematical changes are only beneficial insofar as they lead to real change within the organization.

## Footnotes

[^1]: I know, I cringed too
