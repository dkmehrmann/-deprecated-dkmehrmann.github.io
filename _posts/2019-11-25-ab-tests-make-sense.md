---
layout: post
title: A/B Tests that Make Sense
author: "Andrew Mehrmann"
date: "November 25, 2019"
output: html_document
tags: programeval
---

If your job or hobby involves relating statistical results to people with less than a graduate degree in statistics, this post is for you. What if I told you you'd never have to explain a p-value again? If you're in the business of A/B testing: what if I told you you didn't have to say "no" when somebody asks you "what's the probability that the new is better than the old thing?" Maybe you're not ready to drink the Kool-Aid, but are you at least curious about the flavor?

Yes, this is a Bayesian puff piece. But before you go, let me assure you there isn't a single mathematical equation in what follows; you won't even see the famous theorem. If it was a tour of New York it wouldn't even stop at Times Square. No, this post is merely a correction to 2 years of running A/B tests the wrong way.

Here's a spoiler: the problems arising from sensitivity to priors are far, far smaller than the problems arising from unintuitive results in practical settings. I don't argue this point mathematically, but rather rhetorically outline some of the benefits of a Bayesian approach to A/B testing. Of course, your mileage may vary, and my perspective is largely a response to frustrations arising from trying to jam frequentist statistics sideways into business workflows.

It's easy to get on the A/B testing hype train, but the benefits are actually a bit more nuanced than they might seem. "Knowing what works" seems like a good idea, and indeed almost always is. Unfortunately, A/B testing only really tells us what works


## A Case for A/B Testing

A/B Testing is as simple as it sounds: run two different versions of some program or product in parallel, randomly assign users to one or the other version, and measure some metric(s) of interest. If you've done it right, differences in that metric will either be due to random chance or to the differences in the program or product.[^2] If you can rule out random chance[^3], you've established a causal link between changes in program/product and changes in metric. Once you establish causality, you can accurately predict what will happen in the future. If you can predict what will happen in the future, you can make better decisions. It's really as simple as that.

Upon closer inspection however you can break A/B testing into two varieties according to why you hope to know what will happen in the future.

**Retroactive A/B Testing** can help us avoid losses from rolling out demonstrably bad ideas. If a program degrades metrics during testing, we know that keeping it around will have a negative marginal effect on those metrics, and we shouldn't do so. We must avoid the sunk-cost fallacy in this case and recognize that the best thing for us to do is to cut our losses and revert to the status quo.

**Proactive A/B Testing** can help to increase potential gains by reducing barriers to testing new ideas. When it is easy and expected that ideas will be tested, and that some will fail and that's ok, we can take more risks in what we choose to put in front of customers. If we accept the premise that business decisions are closer to coin-flips than prescient predictions, we can spend less time thinking about which ideas are good or bad (which humans are generally pretty bad at) and more time coming up with ideas to test (which humans are generally pretty good at). In this sense, proactive testing is more of a cultural change than anything else.

![](/figs/2019-11-25-ab-tests-make-sense/ab-profit.png)

Not only can testing help reduce losses and increase gains, it generates a wealth of powerful data when used systematically across an enterprise. From a management perspective, quantifying the value of our work allows us to better understand where to invest resources and forecast the likelihood of the outcomes of our programs or projects. From a micro perspective, teams can use experimental data to generate testable hypotheses and create better content in the first place.

Furthermore, we can use an economic framework to understand how best to leverage testing in different scenarios. Namely, we can define a matrix as follows to help identify which type of testing is appropriate:

![](/figs/2019-11-25-ab-tests-make-sense/ab-table.png)


## Pitfalls of A/B Testing

A/B testing is not without costs however, and is not appropriate for every application. For example, there is an opportunity cost to delaying good ideas from reaching 100% implementation, as well as rejecting good ideas that fail to meet (arbitrary) significance criteria.

Additionally, traditional A/B testing methodology does not reconcile well with typical program or product lifecycles. A standard A/B test starts with calculating a sample size based on a “minimum detectable effect” and expected base rates and/or variances for A and B. This usually requires access to historical data which even Subject Matter Experts rarely have or know where to find, and almost everybody but those trained in statistics typically become confused when informed of the counterintuitive fact that the smaller the effect they hope to discover, the longer they’ll have to run the test.[^4]

Furthermore, results from traditional A/B tests are difficult to explain. Every person who has ever encountered a p-value has struggled to understand it, at least at first. Stakeholders want to know “is this a good idea.” Usually, we don’t have the authority to determine that, but we can give quantitative information to help make that decision. Namely, we wish to answer “how much better is A than B at moving some metric or metrics of interest.”

P-values don’t even attempt to answer this question. Frequentist A/B test outcomes are necessarily binary - we either reject or do not reject the Null Hypothesis that there is no difference between A and B - while the potential gains and losses from an idea being tested are continuous. If an intervention or idea moves the needle by an amount less than the minimum detectable effect, an A/B test will reject it even though it would have resulted in net overall benefit. In other words, A/B tests are extremely conservative and heavily weight the status quo, while businesses and other institutions usually favor change and innovation.

## A Better Way

What frequentist A/B testing intentionally leaves out is context. I recommend a Bayesian framework to A/B testing that includes relevant context such as the decision being made and the environment it’s being made in. In the traditional Bayesian sense, this might also mean including human or empirical expectations for the outcome of the experiment being conducted in the form of a prior.

Critics argue that this makes the analysis subjective, and I would counter with two points: 1) it should be subjective, and 2) it is no more subjective than the statistical significance threshold of p=0.05. To be fair, the danger of human bias may be far greater in certain academic disciplines where frequentist A/B testing is still the norm. This is not to imply that A/B testing is not serious business outside of academia, rather it is an attempt to shape the statistical methodology to the context in which it is applied. This has several practical benefits, some of which are mathematical and some of which are cultural.

Mathematically, a Bayesian approach to A/B testing allows us to make inferences on the probability that A is better than B or vice versa. It also allows us to construct a distribution of the possible values for the difference between A and B. Furthermore, by mapping this probability distribution to a profit/revenue space, this allows us to make inferences in terms of dollars, e.g. “what is the probability that A will generate more than $1000 additional revenue?” or “what is the probability that B is profitable?”

Culturally, by including context in statistical analyses, human experts become first-class citizens and empirical analyses become more accessible. A priori assumptions are framed in terms of "what do you expect to see" rather than "what is the smallest effect that you wish to be able to detect," while results are expressed in language that stakeholders expect and desire to see. Furthermore, keeping the bottom line (e.g. profits or lives saved) as the focus of the test will guide decision makers to optimize for those things directly rather than maximizing short-term incentives.

## Conclusions

It’s important to recognize that testing is a tool and not a dogma; there are plenty of cases where testing might not be appropriate. These include cases where the test will not influence the business decision, or where randomization will induce outsized costs to the team or inconvenience to customers. In these cases, it’s usually possible to use a quasi-experimental or econometric technique to isolate the impact of a business decision, but it also might be possible to alter the cultural or technological landscape that induces these barriers.

From a methodological perspective, critics of Bayesian analysis may have a point: the choice of prior might be just as confusing to business partners as explaining a p-value or choosing a minimum detectable effect. If this should be the case, practitioners should go back to the drawing board and establish a testing framework that works for everyone. Remember to optimize towards better decision making, not a particular method for accomplishing that end.

## Additional Directions

If a randomized experiment should be infeasible, related techniques such as causal modeling or quasi-experimental methods can still help understand the mechanisms that drive positive change. Simply controlling for temporal effects or a handful of pesky covariates can often be far more accurate than eyeball or pre/post methods that are pervasive in non-academic settings.

These methods are most valuable when we do not have the ability to selectively administer a treatment or intervention, but where we have the ability to decide whether or not to administer that treatment in general. These cases are common where regulatory or ethical limitations to randomization are present, such as in pricing or privacy (both of which are huge concerns for an insurance-related business), but also where technological or budgetary concerns limit the ability to randomize.

In general, these techniques along with A/B testing help us separate correlation from causation. In a world of big data, this will grow increasingly important and perhaps overlooked, leading to lots of opportunity for improvement. Causation isn't an end unto itself, but rather a mechanism by which we can predict the future, and thereby make better decisions.

## Footnotes

[^2]: This is because randomization effectively controls for all other factors. If folks are truly randomly assigned to A or B, there is no reason to believe there could be any other factor systemically influencing the metric differently across the groups. Nevertheless, it's possible to control for additional factors you believe could affect the metric of interest during the analysis phase of an experiment.

[^3]: This is done by means of a statistical test. In most cases, a larger sample reduces the chance of differences being due to random chance, and you can be more certain they're due to changes in the product.

[^4]: This is counterintuitive because a small effect would be a bad result for the stakeholder, and running the test for a long time is also politically difficult, so their tradeoffs seemingly don’t make sense.
