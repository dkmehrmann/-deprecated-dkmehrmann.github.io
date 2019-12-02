---
layout: post
title: A/B Tests that Make Sense
author: "Andrew Mehrmann"
date: "December 02, 2019"
output: html_document
tags: programeval
---

This post is Part Two of a three-part series on Randomized Controlled Trials (RCTs) with an emphasis on A/B testing. Other articles in this series are []]() and []().

---

If your job or hobby involves relating statistical results to people with less than a graduate degree in statistics, this post is for you. What if I told you you'd never have to explain a p-value again? If you're in the business of A/B testing: what if I told you you didn't have to say "no" when somebody asks you "what's the probability that the new is better than the old thing?" Maybe you're not ready to drink the Kool-Aid, but are you at least curious about the flavor?

Yes, this is a Bayesian puff piece. But before you go, let me assure you there isn't a single mathematical equation in what follows; you won't even see the famous theorem. If it was a tour of New York it wouldn't even stop at Times Square. No, this post is merely a correction to 2 years of running A/B tests the wrong way.

Here's a spoiler: the problems arising from sensitivity to priors are far, far smaller than the problems arising from unintuitive results in practical settings. I don't argue this point mathematically, but rather rhetorically outline some of the benefits of a Bayesian approach to A/B testing. Of course, your mileage may vary, and my perspective is largely a response to frustrations arising from trying to jam frequentist statistics sideways into business workflows.

## A Better Way

What frequentist A/B testing intentionally leaves out is context. I recommend a Bayesian framework to A/B testing that includes relevant context such as the decision being made and the environment it’s being made in. In the traditional Bayesian sense, this might also mean including human or empirical expectations for the outcome of the experiment being conducted in the form of a prior.

Critics argue that this makes the analysis subjective, and I would counter with two points: 1) it should be subjective, and 2) it is no more subjective than the statistical significance threshold of p=0.05. To be fair, the danger of human bias may be far greater in certain academic disciplines where frequentist A/B testing is still the norm. This is not to imply that A/B testing is not serious business outside of academia, rather it is an attempt to shape the statistical methodology to the context in which it is applied. This has several practical benefits, some of which are mathematical and some of which are cultural.

## Mathematical Benefits




## Cultural Benefits



## Conclusions

Mathematically, a Bayesian approach to A/B testing allows us to make inferences on the probability that A is better than B or vice versa. It also allows us to construct a distribution of the possible values for the difference between A and B. Furthermore, by mapping this probability distribution to a profit/revenue space, this allows us to make inferences in terms of dollars, e.g. “what is the probability that A will generate more than $1000 additional revenue?” or “what is the probability that B is profitable?”

Culturally, by including context in statistical analyses, human experts become first-class citizens and empirical analyses become more accessible. A priori assumptions are framed in terms of "what do you expect to see" rather than "what is the smallest effect that you wish to be able to detect," while results are expressed in language that stakeholders expect and desire to see. Furthermore, keeping the bottom line (e.g. profits or lives saved) as the focus of the test will guide decision makers to optimize for those things directly rather than maximizing short-term incentives.

From a methodological perspective, critics of Bayesian analysis may have a point: the choice of prior might be just as confusing to business partners as explaining a p-value or choosing a minimum detectable effect. If this should be the case, practitioners should go back to the drawing board and establish a testing framework that works for everyone. Remember to optimize towards better decision making, not a particular method for accomplishing that end.

## Footnotes
