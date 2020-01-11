---
layout: post
title: Rethinking A/B Testing
author: "Andrew Mehrmann"
date: "January 09, 2020"
output: html_document
tags: causal
---

This post is Part One of a three-part series on Randomized Controlled Trials (RCTs) with an emphasis on A/B testing. Other articles in this series are [A/B Tests that Make Sense](/2020/01/10/ab-tests-make-sense.html) and [An Economic Framework for A/B Testing](/2020/01/11/economic-framework-for-ab-testing.html).

---

## Thinking About A/B Testing

A/B Testing is as simple as it sounds: run two different versions of some program or product in parallel, randomly assign users to one or the other version, and measure some metric(s) of interest. If you've done it right, differences in that metric will either be due to random chance or to the differences in the program or product.[^2] If you can rule out random chance[^3], you've established a causal link between changes in program/product and changes in metric. Once you establish causality, you can accurately predict what will happen in the future. If you can predict what will happen in the future, you can make better decisions to optimize that future state. It's really as simple as that.

Upon closer inspection however I find it useful to break A/B testing into two "varieties" according to why you hope to know what will happen in the future.

**Retroactive A/B Testing** - AKA "did you remember to A/B test this thing?" - can help us avoid losses from rolling out demonstrably bad ideas. If a program degrades metrics during testing, we know that keeping it around will have a negative marginal effect on those metrics, and we shouldn't do so. We must avoid the sunk-cost fallacy in this case and recognize that the best thing for us to do is to cut our losses and revert to the status quo.

**Proactive A/B Testing** - AKA "we should A/B test this new idea every step of the way" - can help to increase potential gains by reducing barriers to testing new ideas. When it is easy and expected that ideas will be tested, and that some will fail and that's ok, we can take more risks in what we choose to put in front of customers or stakeholders. If we accept the premise that business decisions are closer to coin-flips than prescient predictions[^8], we can spend less time thinking about which ideas are good or bad (which humans are generally pretty bad at) and more time coming up with ideas to test (which humans are generally pretty good at). In this sense, proactive testing is more of a cultural change than anything else.

![](/figs/2019-11-25-ab-tests-make-sense/ab-profit.png)

Not only can testing help reduce losses and increase gains, it generates a wealth of powerful data when used systematically across an enterprise. From a management perspective, quantifying the value of our work allows us to better understand where to invest resources and forecast the likelihood of the outcomes of our programs or projects. From a micro perspective, teams can use experimental data to generate testable hypotheses and create better content in the first place.

## Pitfalls of A/B Testing

In my experience, RCTs including A/B tests are often dogmatized and not thought of in terms of their costs[^4] and benefits[^5]. I hypothesize that this is partially because the people who first attempt to push for A/B testing at an organization realize that - if the idea takes off - they are positioned to become subject matter experts in a niche business function. In other words, their personal incentives are not to push the most valuable methodology, but to push the one that they are a relative expert in. If we seriously want to make a difference, however, we should be realistic about the pitfalls and nuances of running randomized controlled trials. Further, we should be rigorous in assessing each specific use case individually to understand where it makes sense to apply this methodology and where it does not, as opposed to utilizing RCTs as the gold standard across any and all use cases.

One specific pitfall of traditional frequentist A/B testing is that the analytic methodology does not reconcile well with typical program or product lifecycles. A frequentist A/B test starts with calculating a sample size based on a “minimum detectable effect” and expected base rates and/or variances for A and B. This usually requires access to historical data which even Subject Matter Experts rarely have or know where to find, and almost everybody but those trained in statistics typically become confused when informed of the counterintuitive fact that the smaller the effect they hope to discover, the longer they’ll have to run the test.[^6]

Furthermore, results from frequentist A/B tests are difficult to explain. Every person who has ever encountered a p-value has struggled to understand it, at least at first. Stakeholders want to know “is this a good idea.” Usually, we don’t have the authority to determine that, but we can give quantitative information to help make that decision. Namely, we wish to answer “how much better is A than B at moving some metric or metrics of interest.”

P-values don’t even attempt to answer this question. Frequentist A/B test outcomes are necessarily binary - we either reject or do not reject the Null Hypothesis that there is no difference between A and B - while the potential gains and losses from an idea being tested are continuous. If an intervention or idea moves the needle by an amount less than the minimum detectable effect, an A/B test will reject it even though it would have resulted in net overall benefit. In other words, A/B tests are extremely conservative and heavily weight the status quo, while businesses and other institutions usually favor change and innovation.

## Conclusions

There exist plenty of arguments in favor of using RCTs to measure and improve outcomes. Many of these, however, evoke unrealistic expectations of the benefits and avoid discussion of the costs. These well intentioned arguments lead to gaps in supposed experts' knowledge and misapplication of A/B test methodology to cases where it causes more harm than good. In my experience, the shortcomings of A/B testing seem to fall into the following two categories:

   1) RCTs are not thought of in terms of their costs and benefits. Costs are undersold and benefits are oversold
   2) Frequentist methodology causes confusion and doesn't yield the answers most are hoping to glean from rigorous testing

On the other hand, I believe it is possible to work toward solving them. The other articles in this series will address each in turn, and I'm hopeful that I don't come across as skeptical of the RCT in general; I think RCTs are one of the most powerful tools we have to understand a complicated universe. It's precisely *because* I believe in them that I hope to persuade others of ways to improve them, and to hold a realistic view of their costs and benefits.

<ul class="pager">
  <li class="previous disabled"><a href="#">Prev: </a></li>
  <li class="next"><a href="/2020/01/10/ab-tests-make-sense.html">Next: A/B Tests that Make Sense</a></li>
</ul>

## Apx: Advice for Practitioners

As a practitioner, it’s important to recognize that testing is a tool and not a dogma; there are plenty of cases where randomized or interventionist testing might not be appropriate. These include cases where the test will not influence the business decision, or where randomization will induce outsized costs to the team or inconvenience to customers.

If a randomized experiment should be infeasible, quasi-experimental methods can still help understand the mechanisms that drive positive change. Simply controlling for temporal effects or a handful of pesky covariates can often be far more accurate than eyeball or pre/post methods that are pervasive in non-academic settings. These methods are most valuable when we do not have the ability to selectively administer a treatment or intervention, but where we have the ability to decide whether or not to administer that treatment in general. These cases are common where regulatory or ethical limitations to randomization are present, such as in pricing or privacy (both of which are huge concerns for an insurance-related business like my current company), but also where technological or budgetary concerns limit the ability to randomize.

Alternatively, it also might be possible to alter the cultural or technological landscape that induces the barriers to randomized or interventionist testing. For example, centralizing randomization is usually a good idea in consumer-facing businesses, and can lead to lower barriers to implementing tests at scale.[^7] Culturally, it can be difficult to convince teams to subject their work to outside evaluation; even well-intentioned leaders may be rightly concerned about remitting the final launch decision for their program to a methodology they don't fully understand, for example. Changing company or foundation culture to be more empirically-minded is a huge undertaking and not generally one technical contributors are well positioned to drive. For this reason, I've found it important to have both grassroots and leadership support for empiricism to create an environment in which test-driven culture may thrive.

In general, remember that empiricism helps us separate correlation from causation, and that causation isn't an end unto itself, but rather a mechanism by which we can predict the future and thereby make better decisions.

## Footnotes

[^2]: This is because randomization effectively controls for all other factors. If folks are truly randomly assigned to A or B, there is no reason to believe there could be any other factor systemically influencing the metric differently across the groups. Nevertheless, it's possible to control for additional factors you believe could affect the metric of interest during the analysis phase of an experiment.

[^3]: This is done by means of a statistical test. In most cases, a larger sample reduces the chance of differences being due to random chance, and you can be more certain they're due to changes in the product.

[^8]: More on this later

[^4]: Angus Deaton and Nancy Cartwright expand on misconceptions and misuse of randomized controlled trials in [their paper](https://www.sciencedirect.com/science/article/pii/S0277953617307359).

[^5]: An [excellent example of a paper outlining benefits of A/B testing](https://ai.stanford.edu/~ronnyk/ExPThinkWeek2009Public.pdf) from the folks at Microsoft, who I cite often when pitching these concepts.

[^6]: This is counterintuitive because a small effect would be a bad result for the stakeholder, and running the test for a long time is also politically difficult, so their tradeoffs seemingly don’t make sense.

[^7]: See [Netflix](https://medium.com/netflix-techblog/its-all-a-bout-testing-the-netflix-experimentation-platform-4e1ca458c15) and [Microsoft](https://exp-platform.com/Documents/2013%20controlledExperimentsAtScale.pdf) for examples.
