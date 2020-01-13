---
layout: post
title: A Rational View of Campaign Donations
author: "Andrew Mehrmann"
date: "January 12, 2020"
output: html_document
tags: election
---

How do we think about campaign donations? Do we tend to donate to the candidates that we agree with? Or those we believe would be most impactful if they won? Or those whose campaigns we believe we can influence the most?

If we're rational, we should consider all three of these questions. Specifically, when deciding which candidates to help finance, we should consider how much our donation will increase the likelihood a candidate wins as well as how much that candidate winning will further our goals.

## The Probability Your Vote Matters

Imagine a majoritarian vote in which a candidate must secure 50% of the votes to win. The rational choice model of voting[^1] is given by

$$\Delta U = pB - c$$

Where $p$ is the probability your vote flips the election, $B$ is the utility you gain if your candidate wins, and $c$ is the cost of voting (note that $c$ can be positive if there are net benefits to voting regardless of if their candidate wins).

The probability of a single vote (yours or otherwise) flipping that election in favor of the candidate of their choice is given by

$$P(\text{flip}) = P\left(\frac{1}{N}\right)$$

where $N$ is the total number of votes, $P(x)$ is the discrete prior probability distribution on the vote share for that candidate. Note that under a uniform prior, the chances that a single vote flips an election is $\frac{1}{N}$.


## Empirical Examples from US Election

Gelman, Silver, and Edlin performed an [empirical analysis](http://www.stat.columbia.edu/~gelman/research/published/probdecisive2.pdf) using a similar framework for a single voter during a General Presidential Election. They computed the probability a single vote will matter within a state, and multiplied that probability by the probability that that state's electoral votes will matter. They used 2008 election forecasts from FiveThirtyEight as their probability distributions, and their main findings are illustrated below.

<center>
<img src="/figs/2019-12-05-rational-voting/gelman_silver_edlin.png">
</center>
\- Gelman, Silver, Edlin (2010)

Edlin, Gelman, and Kaplan [translated these probabilities](http://www.stat.columbia.edu/~gelman/research/published/charity.pdf) to expected returns on investment assuming that electing the "best" candidate was worth $1000 to each American. If you think this premise is absurd, simply translate the numbers below by a corrective constant of your choice.

<center>
<img src="/figs/2019-12-05-rational-voting/edlin_gelman_kaplan.png">
</center>
\- Edlin, Gelman, Kaplan (2010)

This demonstrates that - social or deontological arguments notwithstanding - the expected value of voting in the US election is almost always significant enough to justify the costs, at least through an altruistic lens.

## Translating to Donations

Voters also have the ability to influence other voters through volunteering and campaign donations. I'll focus on campaign donations, but the resultant framework can easily be translated to refer to volunteer hours.

The probability that a *set of votes* flip the election in favor of a particular candidate is then

$$P(\text{flip} \mid n) = \sum_{\frac{1}{2} - \frac{n}{N}}^{\frac{1}{2}} P(x)$$

where $n$ is the size of the set of votes. For example, the probability that a set of 20 votes for that particular candidate sway the election is the probability that the vote share for that candidate *without* those 20 votes would have been anywhere between 20 votes and 1 vote short inclusive. The equation above represents the sum of those probabilities. If the candidate would have won, there is no chance to sway the election, and if the candidate would have been more than 20 votes short, they would have lost with or without the 20 votes.

It may also be useful to approximate the discrete distribution with a continuous distribution (such as the normal approximation to the binomial distribution) for large enough $N$.

$$P(\text{flip} \mid n) = \int_{\frac{1}{2} - \frac{n}{N}}^{\frac{1}{2}} P(x) dx$$

A theoretical example for 20 votes is illustrated below, assuming that the vote share for a candidate is expected to be about 49.5% with a Standard Error of 0.5%, and the size of the voter base is 5000 voters:

<center>
<img src="/figs/2019-12-05-rational-voting/voteshare.png">
</center>

$P(\text{flip} \mid n) = 0.267$ in this example, meaning that there is a 26.7% chance that your candidate loses the election by less than or equal to 20 votes. This exaggerated example could represent something like convincing your Bridge Club to vote a certain way in your small city's mayoral election that is expected to be close (and for some reason has extremely precise polling).

Now imagine a function $\Gamma(D)$ that represents the *marginal* vote returns to investment in a candidate. In other words, this function translates a campaign donation $D$ into the number of resultant votes that the donation buys. Keep in mind that turning out a new voter for your candidate in a two-candidate system would be worth one additional vote, and flipping a voter from the other candidate to your candidate would be worth two.

The probability that your *donation* will flip an election is then given as

$$P(\text{flip} \mid D) = \int_{\frac{1}{2} - \frac{\Gamma(D)}{N}}^{\frac{1}{2}} P(x) dx$$

Finally, recall the utility constants $B$ and $c$ from the rational choice model that represent the utility gained from the election being flipped and the cost of voting, respectively. Putting it all together, we get the expected utility function

$$E(D) = \left[\int_{\frac{1}{2} - \frac{\Gamma(D)}{N}}^{\frac{1}{2}} P(x) dx\right] \cdot B - c$$

## Implications for Individual Political Activity

Intuitively, campaign spending probably has diminishing marginal returns, meaning that $\Gamma(D)$ also depends on existing spending. It also probably matters whether the candidate is an incumbent or a challenger.[^2] Therefore, quite a great deal of guesswork will go into calculating $\Gamma(D)$, and of course $P(x)$ and $N$ are not known exactly before an election either.

Nevertheless, frameworks like these can get us in the ballpark.[^3]

They can also help us think about tradeoffs between donating to a political campaign and donating elsewhere. For example, if you take the premise from the example above that your Presidential candidate is worth $1000 to each American, you should consider that the cost to either sway one voter from the other candidate to your candidate (or turn out two new voters for your candidate) is likely far less than the $100,000 of benefit that would allegedly result by directing your donation to a high-impact state like New Mexico.

## Footnotes

[^1]: See [Edlin, Gelman, and Kaplan](https://www.nber.org/papers/w13562.pdf) who refer to Blais (2000)

[^2]: In fact, these [have been shown](https://www.pitt.edu/~cwb7/assets/papers/JOP%2011%20article.pdf) to hold at least for judicial elections

[^3]: I think of this as a variant of a [Fermi Problem](https://en.wikipedia.org/wiki/Fermi_problem)
