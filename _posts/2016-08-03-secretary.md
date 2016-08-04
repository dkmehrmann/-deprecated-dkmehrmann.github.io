---
layout: post
title: "The Secretary Problem"
author: "Andrew Mehrmann"
date: "August 3, 2016"
output: html_document
category: blog
---

Finding an apartment is tough, especially in a big city. As a fan of economics, I often think of situations like this in terms of the decisions, alternatives, and preferences we face. An economist might attempt to quantify our preferences by asking questions like *How important is an extra bathroom to you?* or *How strong is your aversion to busy streets?*. While it might be tough to get reliable quantitative estimates of our preferences, its probably far easier for us to compare apartments to one another and decide which ones we like better than others. This could go on for all pairwise combinations of apartments we are considering until we have ranked each apartment in the set. Naturally, the utility-maximizing decision would be to choose our top-ranked apartment and live happily ever after. Unfortunately it doesn't quite work like that in Chicago, as apartments go on and off the market very, very quickly. If you're lucky enough to schedule a showing, you'd better believe there will be other showings to people ready to seal the deal in the near future. You have to act quickly if you want to land a place, but how do you know if you're getting the best deal out of all your options without knowing what you might see in the future?

## Optimal Stopping Theory

**Optimal Stopping Theory** is a mathematical tool designed to help with these situations. The basic idea is this: you have some finite set of candidate choices and you get to inspect them one-by-one. Your goal is to select the best one, but once you pass on one candidate you may not go back to it, and once you choose a candidate you must stick to your choice. Optimal Stopping Theory is all about ranking your alternatives, so it is always assumed that the candidates can be placed in some order that follows the usual rules about ranking (1 > 2 > 3 etc.). The question becomes when to stop inspecting candidates and settle on one? Your algorithm for doing so is called a **stopping rule**, and it determines your strategy for selecting a candidate. You may simply select the first one you see at a $\frac{1}{n}$ chance of selecting the best, but can you improve your chances by some other method? Is there a method that maximizes your chances of selecting the optimal candidate? Optimal Stopping Theory says yes.

A few tangible examples of this include the [secretary problem](https://en.wikipedia.org/wiki/Secretary_problem), where the candidates are applicants for a secretary position and a hiring manager is tasked with interviewing them. To fit into the rules of optimal stopping theory it is assumed the manager must make the hiring decision on the spot. Another example is the [fussy suitor problem](https://www.washingtonpost.com/news/wonk/wp/2016/02/16/when-to-stop-dating-and-settle-down-according-to-math/) where the candidates are potential marriage partners. In my opinion, this example more closely fits within the mathematical constraints as generally once you pass on a potential suitor there is no going back, and once you settle on one it is (hopefully) for life.

For our apartment search, we can think of the *interviews* or *dates* from above as apartment showings. As I mentioned, apartments really do go quickly here so let's assume a given apartment will go off the market immediately after being shown (in reality it might be a couple days, but just pretend)
. Let's also assume that once we settle on an apartment we won't look at any others (this is pretty certain in reality anyway). Finally we have to make the assumption that the number of showings we plan to go on is finite (duh) and known (not-so-duh). While the latter is a strong assumption, we could probably guess pretty close to the actual number we'd be willing to go on or have time for (probably more than 5, less than 20).

## Numerical Simulation

Ok, so the question we need to answer is what stopping rule maximizes the probability of selecting the best alternative or candidate. We can try a few out, and I'll set up the code so that you can write in your own logic and test your own stopping rules. This is a good time to let you know that this will be as much a coding demonstration as an illustration of optimal stopping theory. I'm an R programmer, not a mathematician, but I find this topic really, really cool. 

#### The set of candidates


{% highlight r %}
library(gridExtra)
library(ggplot2)

# a function to make a set of candidates in random order
make_shuffle_candidates <- function(n) return(sample(1:n))
{% endhighlight %}

We're going to assume that the candidates come to us in purely random order. This simplifies the math a little bit, but it is an assumption to bear in mind when applying this to the real world. 

#### Simulation Framework

We aim to set up an experimental framework for testing various stopping rules. Let's write a function that takes some number of candidates and some general stopping rule and returns the output of the stopping rule.


{% highlight r %}
# a wrapper function do use within replicate
do_sim <- function(n_cand, stopping_rule, ...){
  n_cand <- max(1, n_cand) # don't want 0 or negative
  x <- make_shuffle_candidates(n_cand)
  return(stopping_rule(x, ...))
}
{% endhighlight %}

Now let's write a position-based stopping function to test our naive position-based approach. To give these simulations a uniform feel, let's say the stopping functions must take a vector of candidate ranks as the first argument and return the rank of the candidate chosen.


{% highlight r %}
# a stopping rule based on position
stop_position <- function(x, pos){
  return(x[pos])
}
{% endhighlight %}

Then we try out just one iteration to check our work. Here, our stopping rule is to take the first candidate. If it helps your understanding, think about this in terms of job candidates, marital suitors, or apartment showings where we'd just settle for the first one that comes our way.


{% highlight r %}
r <- do_sim(n_cand=20, stopping_rule=stop_position, pos=1)
r
{% endhighlight %}



{% highlight text %}
## [1] 12
{% endhighlight %}

The output of this run of the experiment was 12. That means our stopping rule selected the candidated ranked 12 out of 20. But what happens if we run the experiment many times?


{% highlight r %}
# a function to analyze the results
analyze <- function(which_best){
  pbest <<- (table(which_best)/length(which_best))[1]
  exp_rank <<- mean(which_best)
  
  p <- ggplot(data.frame(x=which_best), aes(x=x, y=..prop..)) + 
              geom_bar(color='darkblue', fill='lightblue') + 
              labs(title="Rank of Candidate Selected - 100,000 Replications", 
                   x='Rank', y='Density')
  print(p)
}

which_best <- replicate(100000,                                # 100000 simulations
                        do_sim(n_cand=20,                      # 20 candidates per sim
                               stopping_rule=stop_position,    # our stopping rule
                               pos=1))                         # select candidate in position 1
analyze(which_best)
{% endhighlight %}

![center](/figs/2016-08-03-secretary/unnamed-chunk-5-1.png)

This plot shows the *rank of the candidate selected by our stopping rule*. Ideally our stopping rule would choose the highly-ranked canidates more often than the others. That said, we didn't do very good, but that's to be expected. We can use this as our baseline stopping rule, or the one we aim to try to beat. 

We can consider this stopping rule beaten if one or both of the following happen:

* We improve our **Probability** of selecting the optimal or best candidate
* We improve the **Expected Rank** of the candidate we select under our stopping rule

The *Expected Rank* (or simply the average of the ranks) for this strategy is 10.53143, and the probability of selecting the optimal was 0.04978.

#### Stopping Strategies

What makes this problem so difficult is that you don't have any context, meaning you have no idea how good the first candidate is compared to the others. This means we can't utilize the value of the rank except for comparison; our strategies have to be blind to scale. Similarly, this mathematical framework translates best to the real world when we don't know much a priori about the candidates we have to choose from. For example, a seasoned hiring manager may "just know" when the right candidate interviews for the job and an eligible bachelor may stop dating once he falls in love. But if my two roommates and I (all computer nerds) go apartment searching, we have no choice but to resort to convoluted mathematical strategies because we don't have much experience.

Consider this: when our stopping rule sees the first candidate, what information does it have to inform its decision? None, except for the number of candidates it will see after that one. If the stopping rule decides its time to stop, the gig is up, but if it decides to move on, it has also collected some information along the way. So each discarded candidate adds information to the system at the cost of a $\frac{1}{n}$ chance that it was the best candidate. When my roommates and I see our first apartment we have no clue if its a good deal or not, but after we go on a couple showings we start to get a feel for what is good and what is bad.

Let's take a shot in the dark. In this strategy, let's skip the first candidate but store its rank. Think of that an ex that you can't stop measuring everyone else you meet against. As these things go, you don't want to settle for anybody less than what you've had before, so you reject everyone that isn't as good as the first candidate. We'll call this the **"there's nothing like a first love"** strategy. To make it even more depressing and accurate, we need to know what to do if the first candidate actually was the best. In that case, we won't know until we reach the last candidate that none of the candidates were better than the first, so we'll have to settle for them (or die alone).


{% highlight r %}
# a stopping rule that compares everone to the first one it sees
# remember, this takes the vector of ranks and returns the rank of the decision
first_love <- function(x){
  cands <- x[2:length(x)]                           # the candidates
  first <- x[1]                                     # the "first love"
  which_better <- which(cands < first)              # which ones are better than the first
  choice <- cands[which_better[1]]                  # the first candidate that was better
  if (is.na(choice)) choice <- cands[length(cands)] # if the first was best choose the last
  return(choice)
}

which_best <- replicate(100000, do_sim(n_cand=20, stopping_rule=first_love))

analyze(which_best)
{% endhighlight %}

![center](/figs/2016-08-03-secretary/unnamed-chunk-6-1.png)

Wow! Now we're over 3 times as likely to select the optimal candidate by simply discarding the first one and using them for information. Cold, isn't it? If you want the numbers, the *Expected Rank* is 5.78311 and the probability of selecting the optimal is 0.17825. Intuitively, an expected rank of about 5 or 6 makes sense. On average, the first candidate will be a rank of 10 or 11. The algorithm rejects that one, and accepts the next one it sees that is better than 10 or 11 (those ranked 1:9 or 1:10). Out of those 1:9 or 1:10, again each is equally likely so on average it will select one of rank 5 or 6. The math might be a little off, but this is a good way to start thinking about what strategies might be better than others.

#### Optimal Strategy

It turns out (and we've shown above) that if you simply select the first candidate you are no better than chance. If you deny the first candidate you become far more likely to select the optimal candidate, so an optimal strategy may involve skipping the first $m$ candidates. Indeed, mathematics tells us that it does. I'll spare you the math here, but it is given in the [Wikipedia Article](https://en.wikipedia.org/wiki/Secretary_problem). The key points are:

* The optimal cutoff is $m = \frac{n}{e}$
* The probability of selecting the optimal candidate is $\frac{1}{e} = 0.368$


{% highlight r %}
# the optimal stopping rule, according to math
optimal <- function(x){
  m <- round(length(x)/exp(1))
  cands <- x[m:length(x)]          
  first <- x[1:(m-1)]                  
  best_first <- min(first)
  which_better <- which(cands < best_first)         
  choice <- cands[which_better[1]]                  
  if (is.na(choice)) choice <- cands[length(cands)] 
  return(choice)
}

which_best <- replicate(100000, do_sim(n_cand=20, stopping_rule=optimal))

analyze(which_best)
{% endhighlight %}

![center](/figs/2016-08-03-secretary/unnamed-chunk-7-1.png)


Using the optimal strategy the *Expected Rank* is 4.65275 and the probability of selecting the optimal is 0.37878. This is right in line with the theory, at least for this $n$. To be perfectly clear, this theory is implying that skipping the first 37% of candidates simply to gather information gives you the best chance of selecting the best candidate. The assumptions here are important: the candidates come to you in random order, you have no way to tell how much better one candidate is than the other, and you have no information a priori about the candidates. 

## Finding an Optimum Numerically

Until now, we have only discussed an optimum in terms of maximizing the probability of selecting the best candidate. What if we wanted to maximize our expected outcome? That is, how can we ensure that we select candidates with low rank on average? Suppose that under the same discard-$m$ framework, we wish to find some cutoff $r$ that minimizes the expected rank of our selected candidate. We're decent R programmers and terrible mathematicians, so we'll solve it via simulation. Along the way, we can also calculate the probability of selecting the best candidate so we'll report both pieces of information. 


{% highlight r %}
# cutoff is some proportion of the original candidates
find_best <- function(x, cutoff){
  r <- max(1, round(length(x)*cutoff))
  cands <- x[r:length(x)]          
  first <- x[1:(r-1)]                  
  best_first <- min(first)
  which_better <- which(cands < best_first)         
  choice <- cands[which_better[1]]                  
  if (is.na(choice)) choice <- cands[length(cands)] 
  return(choice)
}

# run a simulation for some cutoff and return prob. of selecting the best and exp. rank
run_one <- function(cutoff, n_cand){
  which_best <- replicate(10000, do_sim(n_cand=n_cand, stopping_rule=find_best, cutoff))
  
  pbest <- (table(which_best)/length(which_best))[1]
  exp_rank <- mean(which_best)
  
  return(list(pbest=pbest, exp_rank=exp_rank))
}

# run the simulation
res <- lapply(seq(0,1, by=0.01), run_one, n_cand=20)    

# some data munging
df <- data.frame(matrix(unlist(res), ncol=2, byrow=T))
colnames(df) <- c('pbest', 'exp_rank')
df$Proportion_Discarded <- seq(0,1, by=0.01)

# plot the results
p1 <- ggplot(df, aes(x=Proportion_Discarded, y=pbest)) + 
        geom_line() + labs(x='Proportion Discarded', y='Probability',
                           title='Probability of Selecting the Best Candidate')
p2 <- ggplot(df, aes(x=Proportion_Discarded, y=exp_rank)) + 
        geom_line() + labs(x='Proportion Discarded', y='Expected Rank',
                           title='Expected (or average) Rank')
grid.arrange(p1, p2, ncol=2)
{% endhighlight %}

![center](/figs/2016-08-03-secretary/unnamed-chunk-8-1.png)

So the optimal proportion of candidates to discard is somewhere between 0.3 and 0.5 in terms of maximizing your probability of finding the best candidate, apartment, spouse, whatever. But you can also give yourself a pretty good chance of scoring a highly ranked candidate (about a 4 or 5 on average) anywhere between 0.15 and 0.35. But does it matter if we change the number of candidates from 20 to, say, 200?


{% highlight r %}
# simulation and data munging
res <- lapply(seq(0,1, by=0.01), run_one, n_cand=200)
df <- data.frame(matrix(unlist(res), ncol=2, byrow=T))
colnames(df) <- c('pbest', 'exp_rank')
df$Proportion_Discarded <- seq(0,1, by=0.01)

# plot the results
p1 <- ggplot(df, aes(x=Proportion_Discarded, y=pbest)) + 
        geom_line() + labs(x='Proportion Discarded', y='Probability',
                           title='Probability of Selecting the Best Candidate')
p2 <- ggplot(df, aes(x=Proportion_Discarded, y=exp_rank)) + 
        geom_line() + labs(x='Proportion Discarded', y='Expected Rank',
                           title='Expected (or average) Rank')
grid.arrange(p1, p2, ncol=2)
{% endhighlight %}

![center](/figs/2016-08-03-secretary/unnamed-chunk-9-1.png)

The optimal cutoff for maximizing your probability of selecting the best candidate remains the same, but the optimal for maximizing your expected outcome has changed! I'm going to leave this one as sort of a cliffhanger. The truth is, I haven't looked at the math enough to know why that might be. I do know however that there are numerous papers written on this topic, specifically the secretary problem. As a student I simply don't have time to tackle this problem in any more detail, but I've spent an embarassingly large amount of time thinking about it.

## Other Considerations

#### Constraints

Now suppose each candidate has a "score" from 1 to 100 associated with them instead of pure ranks. This new information might change the way we think about this problem. For example, we know a rank of 2 is better than a 3 and a rank of 3 is better than a 4. But how much better? Is the 2 as much better than the 3 as the 3 is to the 4? This new information also allows us to *constrain* our optimization by, for example, setting a threshold score below which any candidate is outright rejected. Let's say we want to hire a data scientist for an entry level position and we plan to interview 20 of them. We score each of them during the interview from 1 to 100 based on their skills, experience, and level of education (say 10 points for Python skills, 10 points for R skills, 1 point for SAS, etc.). Now we can still rank them but we can also refuse to take anybody who scored less than a 50. How does that impact our strategy?

#### Apriori knowledge

What if, instead of the above, we scored each candidate *before* their interview, based on their resume. Now we have information about each candidate's *expected* rank and some level of uncertainty regarding that expectation. This type of mathematical model could be applied more readily in the real world, as we often do have knowledge about our choices before we make them.

#### Uncertainty

How does your uncertainty about the number of candidates affect your decision? Let's say you know you're going to look at about 20 apartments with standard deviation of 4. You know the optimal stopping rule is $\frac{20}{e} = 7$, so we'll fix that but vary the true amount of candidates according to a normal distribution.


{% highlight r %}
# discard first r candidates
discard_r <- function(x,r){
  cands <- x[r:length(x)]          
  first <- x[1:(r-1)]                  
  best_first <- min(first)
  which_better <- which(cands < best_first)         
  choice <- cands[which_better[1]]                  
  if (is.na(choice)) choice <- cands[length(cands)] 
  return(choice)
}

which_best <- replicate(100000, do_sim(n_cand=rnorm(n=1, mean = 20, sd=4), 
                                       stopping_rule=discard_r, 7))

analyze(which_best)
{% endhighlight %}

![center](/figs/2016-08-03-secretary/unnamed-chunk-10-1.png)

The *Expected Rank* is 4.61015 and the probability of selecting the optimal is 0.37618, so we did a little worse than optimal when the number of candidates was fixed. Nonetheless, the stopping rule works pretty well even when we're off a little on our estimate of how many candidates there are going to be. Good news for apartment hunting!

***

#### Further Reading

[The Odds Algorithm](https://en.wikipedia.org/wiki/Odds_algorithm)
