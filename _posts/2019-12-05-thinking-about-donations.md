---
layout: post
title: A Rational View of Campaign Donations
author: "Andrew Mehrmann"
date: "January 12, 2020"
output: html_document
tags: election effectivealtruism
---

How much do we believe our votes or campaign contributions matter? How do we think about who to vote for or donate to? Do we tend to donate to the candidates that we agree with, or those we believe would be most impactful if they won, or those whose campaigns we believe we can influence the most? If we're rational, the answer to all of these should be "yes."

In most US elections - including all the major ones - each person gets one vote. The probability that a single vote matters is very small, but the influence of a deciding vote would be enormous. In other words, the expected value of a vote is not as close to zero as you might imagine.

But voting is only one part of the election process. There are huge and expensive campaigns run to convince voters to turn out and vote for a certain candidate. If these campaigns are effective, you can think of them as buying votes; money goes into the campaign machine, and votes come out. This gives a nasty quid pro quo stench to the whole thing, but it is not any more corrupt than Gillette advertising razors on TV. Money in - votes out.

Campaign donations are how the citizenry helps fund these advertising programs, and since they are just buying votes, it follows that a donation from you to your favorite candidate helps to buy a certain number of votes. But how many? It might be tempting to take the total number of votes for a candidate and divide by total campaign funding, but that would be incorrect[^2]. It turns out that this is a notoriously hard problem, because there are issues of [reverse causality](https://fivethirtyeight.com/features/money-and-elections-a-complicated-love-story/), field experiments are infeasible, and natural experiments are few and far between.

Nevertheless, a formal framework can help to think about these problems more rigorously, even if it doesn't allow us to put a dollar value on the impact of our vote or donation. In what follows, I outline a fairly straightforward framework for thinking about voting and campaign donations in terms of their expected impact.

## The Probability Your Vote Matters

The rational choice model of voting[^1] is given by

$$\Delta U = pB - c$$

Where $p$ is the probability your vote flips the election, $B$ is the utility you gain if your candidate wins, and $c$ is the cost of voting (note that $c$ can be positive if there are net benefits to voting regardless of if their candidate wins). This is pretty straightforward mathematical symbolism for what we already know.

For simplicity, imagine a majority-wins vote in which a candidate must secure 50% of the votes to win. The probability of a single vote (yours or otherwise) flipping that election in favor of the candidate of the voter's choice is then given by

$$P(\text{flip}) = P^{(1)}\left(\frac{1}{2}\right)$$

where $P^{(1)}(x)$ is the discrete prior probability distribution on the vote share for that candidate without your vote. All this means is that the probability your vote "matters" is the probability that the election would have been exactly tied if not for your vote.

Note that under a uniform prior, where we know absolutely nothing about the expected share of votes for either candidate, the chances that a single vote flips an election is $\frac{1}{N}$ where $N$ is the total number of votes in the election. This is a typical but naive view of how much a vote matters. It's naive because we often have a pretty good idea how many votes a candidate is expected to get. Even if 2016 seems like evidence *against* our ability to predict elections, we still had a much better notion of what percentage of the vote each candidate was expected to get than "somewhere between 0 and 100%."


## Empirical Examples from US Elections

Gelman, Silver, and Edlin performed an empirical analysis using a similar framework for the 2008 General Presidential Election. Using election forecasts from FiveThirtyEight as their probability distributions, they computed the probability a single vote would matter within a state. They also took the extra step of multiplying that probability by the probability that that state's electoral votes would matter in a similar fashion to get the state-by-state probabilities that a single vote would tip the whole election.

<center>
<img src="/figs/2019-12-05-rational-voting/gelman_silver_edlin.png">
</center>
\- [Gelman, Silver, Edlin (2010)](http://www.stat.columbia.edu/~gelman/research/published/probdecisive2.pdf)

Edlin, Gelman, and Kaplan translated these probabilities to expected returns on investment assuming that electing the "best" candidate was worth $1000 to each American. If you think this premise is absurd, simply translate the numbers below by a corrective constant of your choice.

<center>
<img src="/figs/2019-12-05-rational-voting/edlin_gelman_kaplan.png">
</center>
\- [Edlin, Gelman, Kaplan (2010)]((http://www.stat.columbia.edu/~gelman/research/published/charity.pdf))

This demonstrates that - social or ontological arguments notwithstanding - the expected value of voting in the US election is almost always significant enough to justify the costs, at least through an altruistic lens.

Through a completely self-interested utility framework, the argument gets a bit tougher. That $1000, instead of being multiplied by all the people in the US, is only applied to you. This makes it puzzling to some why anybody votes in the first place, because the expected self-interested utility is so low that it can't possibly be worth the time and effort. Edlin, Gelman, and Kaplan [argued in 2007](https://www.nber.org/papers/w13562.pdf) in favor of myriad other reasons, including social pressure, that help explain through a utility framework why people vote. I find these arguments quite convincing, and they also explain why people turn out to elections with much smaller stakes than the US Presidential election.

## Translating to Donations

Voters also have the ability to influence other voters through volunteering and campaign donations. I'll focus on campaign donations, but the resultant framework can easily be translated to refer to volunteer hours.

The probability that a *set of votes* flip the election in favor of a particular candidate is then

$$P(\text{flip} \mid n) = \sum_{\frac{1}{2} - \frac{n}{N}}^{\frac{1}{2}} P^{(n)}(x)$$

where $n$ is the size of the set of votes, and $P^{(n)}(x)$ is the prior probability distribution on the vote share for that candidate without that set of votes. This represents the intuitive fact that the probability that a set of 20 votes for a particular candidate sway the election is the probability that the vote share for that candidate *without* those 20 votes would have been anywhere between 20 votes and 1 vote short inclusive. The equation above represents the sum of those probabilities, i.e. the total probability of those votes swaying the election. For completeness, if the candidate would have won anyway, those votes certainly don't sway the election, and if the candidate would have been more than 20 votes short, they would have lost with or without the 20 votes.

It may also be useful to approximate the discrete distribution with a continuous distribution (such as the normal approximation to the binomial distribution). This will have no practical significance for large enough $N$[^4], and simplifies some of the analysis.

$$P(\text{flip} \mid n) = \int_{\frac{1}{2} - \frac{n}{N}}^{\frac{1}{2}} P^{(n)}(x) dx$$

A theoretical example for 20 votes is illustrated below, assuming that the vote share for a candidate is expected to be about 49.5% with a Standard Error of 0.5%, and the size of the voter base is 5000 voters:

<center>
<img src="/figs/2019-12-05-rational-voting/voteshare.png">
</center>

$P(\text{flip} \mid n) = 0.267$ in this example, meaning that there is a 26.7% chance that your candidate loses the election by less than or equal to 20 votes. This exaggerated example could represent something like convincing your Bridge Club to vote a certain way in your small city's mayoral election that is expected to be close (and for some reason has extremely precise polling).

Now imagine a function $\Gamma(c)$ that represents the *marginal* vote returns to investment in a candidate. In other words, this function translates a campaign donation $c$ into the number of resultant votes that the donation buys. Keep in mind that turning out a new voter for your candidate in a two-candidate system would be worth one additional vote, and flipping a voter from the other candidate to your candidate would be worth two.

The probability that your *donation* will flip an election is then given as

$$P(\text{flip} \mid c) = \int_{\frac{1}{2} - \frac{\Gamma(c)}{N}}^{\frac{1}{2}} P^{\ast}(x) dx$$

Where $P^{\ast}(x)$ now represents the distribution of the vote share without your donation. Finally, recall the utility constants $B$ and $c$ from the rational choice model that represent the utility gained from the election being flipped and the cost of voting, respectively. Now take $c$ to represent the cost of the donation, and we get the expected utility function

$$E(c) = \left[\int_{\frac{1}{2} - \frac{\Gamma(c)}{N}}^{\frac{1}{2}} P^{\ast}(x) dx\right] \cdot B - c$$

This gives an expected utility model for campaign donations relating a donation of size $c$, the expected vote share gain from a donation to a certain candidate $\Gamma(c)$, the probability distribution of that candidate's vote share $P^{\ast}$, and the utility gained from that candidate winning $B$.

## Implications for Individual Political Activity

At a high level, the takeaway from this is that a rational model of campaign donations should account for - at a minimum - the four variables outlined above. Because thinking in four dimensions is unnatural and difficult, it's my opinion that we often optimize for a subset of these, especially $B$ and $c$.

For example, many Democrats believe that the current Senate Majority Leader Mitch McConnell (R - Kentucky) is blocking votes on legislation passed to his desk from the Democrat-majority House. This has lead some individual voters to donate to his democratic challenger in the 2020 senate election, Amy McGrath. In fact, at the time of this writing more of McGrath's funding has [come from outside of Kentucky](https://www.opensecrets.org/races/geography?cycle=2020&id=KYS1&spec=N) than McConnell's. These donors must be in some way thinking about these tradeoffs, but it's hard to see how they can go about estimating $P$ or $\Gamma$ this early in the election. My guess is that they aren't, but that doesn't mean they're not acting rationally - maybe they believe $B$ is so high that any reasonable assumptions about $\Gamma$ or $P$ would imply that donating to McGrath is the most impactful thing they can do with their present budget for political donations.

Alternatively, you might be able to optimize your campaign donations by focusing on close races (increasing $P(\text{flip})$) that have less funding (increasing $\Gamma(c)$) but will be very impactful (increasing $B$). Keeping with the contemporary example of the 2020 Senate race, I put together a quick sketch of the current state of funding for each seat that will be up for grabs using data from [FiveThirtyEight](https://fivethirtyeight.com/features/were-checking-in-on-all-those-2020-senate-races-a-few-gop-incumbents-look-vulnerable/) and [OpenSecrets](https://www.opensecrets.org/races).[^5] Races for which OpenSecrets had no information are not included.

<center>
<img src="/figs/2019-12-05-rational-voting/money_senate_races.png">
</center>

The x axis is a proxy for how close the race is expected to be - albeit not a very good one - and the y axis is a proxy for how large $\Gamma(c)$ is expected to be. I expect the relationship between existing funding and impact to be monotonically decreasing, and the relationship between closeness of the race and impact to increase as the race gets closer. There is likely a correlation between the marginal impact of campaign spending and how close the race is, but that correlation is expected to be positive all else equal, so it doesn't change the suggestion that you should look for close and underfunded races to direct your campaign donations to.

## Implications for Altruism

Calculating the expected value of a campaign donation can also help us think about tradeoffs between donating to a political campaign and donating elsewhere. If you interpret $B$ as a general level of wellbeing instead of personal utility, you can compare the wellbeing generated by your campaign donation to a donation directed elsewhere.

For example, if you take the premise from the example study [linked above](#empirical-examples-from-us-election) that your Presidential candidate is worth \\$1000 to each American, you should consider that the cost to either sway one voter from the other candidate to your candidate (or turn out two new voters for your candidate) is likely far less than the \\$100,000 of benefit that would allegedly result by directing your donation to a high-impact state like New Mexico.

Of course, for national elections we could assume that Campaign Managers perform similar calculations such that your donation will be directed wherever it will be most likely to increase the chances of your candidate winning. If we consider the results of the study again, and assume that $\Gamma(c)$ doesn't vary too much from state to state (except through the level of general spending in that state), we'd expect to see the most campaign spending in states like New Mexico, Virginia, New Hampshire, and Colorado in 2008.

Four years later, that's exactly what NPR [observed for 2012](https://www.npr.org/sections/itsallpolitics/2012/11/01/163632378/a-campaign-map-morphed-by-money) (I couldn't find good data for 2008):

<center>
<img src="/figs/2019-12-05-rational-voting/ad_spending_map.png">
</center>

But the same might not be said for more volatile state or local elections. The purpose of this post is not to tell you how to donate, but rather to give you another perspective on how to think about donating (or voting).

## How Many Votes can a Dollar Buy?

Nevertheless, frameworks like these can start us asking the right questions, and perhaps even get us in the right ballpark.[^3] For example, sites like [FiveThirtyEight](https://fivethirtyeight.com/) and [ElectionBettingOdds](https://electionbettingodds.com/) can help us estimate $P(x)$ by different means, and we can get reasonable guesses about $N$ by looking at historical data. But what about $\Gamma(c)$? It turns out this is an especially difficult thing to estimate.

Intuitively, campaign spending has diminishing marginal returns, meaning that $\Gamma(c)$ also depends on existing spending and the size of the potential donor base. It also probably matters whether the candidate is an incumbent or a challenger, however the first two studies I found on the subject of diminishing marginal returns gave opposite conclusions on the question on incumbency:

> campaign finance restrictions that limit candidate spending disproportionately harm challengers, increasing the incumbency advantage and decreasing electoral competition.

\- [Bonneau and Cann](https://www.pitt.edu/~cwb7/assets/papers/JOP%2011%20article.pdf)

>  We find that stricter limits increase political competition by creating a larger pool of candidates that is on average less wealthy. Moreover, we find that stricter spending limits reduce the incumbency advantage.

\- [Avis, Ferraz, Finan, and Varjao](https://www.nber.org/papers/w23508.pdf)

All this is to say pinning down an actual dollar amount for the expected value of a campaign donation is really, really hard unless you have better data, methods, or assumptions than I have access to (or am willing to track down). That's not to say you should give up and go home, rather that these are the types of questions we should be asking if we're to make good decisions as actors in our respective democracies.

## Conclusions

In order to maximize the impact of one's voting behavior and campaign donations, one should consider not only the expected benefit of their chosen candidate winning, but also the likelihood their vote or dollar will make a difference. This naturally gives rise to an expected utility framework for campaign donations that builds on similar work for voting behavior.

It can be useful to think about campaign donations in an expected utility framework, and much of the utility of such a framework might be found in revealing how little we understand about its underlying assumptions. It might seem obvious that the chance your donation sways the election times the utility of the election being swayed equals your expected utility of a vote or donation. But thinking through all that goes into those calculations can give insight into where more inquiry is needed.

This is certainly not to say that donations and voting should cease until further notice. When the stakes are high, as they always are in democracy, the right choice under uncertainty is certainly not to fail to act on what you believe is right. Perhaps the thought exercise of revealing how much we don't understand about our own political action is humbling enough to warrant the effort.

## Footnotes

[^1]: See [Edlin, Gelman, and Kaplan](https://www.nber.org/papers/w13562.pdf) who refer to Blais (2000)

[^2]: For example, contemporary presidential campaigns usually raise about a billion dollars. They also usually get about 60-70 million votes, meaning that about \\$15 is spent per vote for that candidate. But this assumption of linearity breaks down if you think about what happens if a candidate spends \\$0, or \\$2 billion; would they really get 0 or all the votes? Certainly not, because campaign spending (probably) exhibits diminishing marginal returns: the last voter you buy is far more expensive than the first.

[^3]: I think of this as a variant of a [Fermi Problem](https://en.wikipedia.org/wiki/Fermi_problem)

[^4]: While not a formal proof, this comes from the [Normal Approximation to the Binomial Distribution](https://en.wikipedia.org/wiki/Binomial_distribution#Normal_approximation) which works fine when $N$ is larger than a few dozen and the predicted vote share is not near 0 or 1.

[^5]: Code for the plots in this post can be found [on Google Collaboratory](https://colab.research.google.com/drive/1jR2yfx_yyRdeIRPkLzvlH6FQJFjV00A1).
