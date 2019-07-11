---
layout: post
title: "This Election, use your Data Skills for Good"
author: "Andrew Mehrmann"
date: "July 6, 2019"
output: html_document
category: election
---

I try to stay as far away from "politics" as possible. Facts often go by the wayside and we're left bickering in circles about who's righteous and who's evil and chances are we all want the same things anyway so really what's the point. I'm not going to change your mind and you're not going to change mine because we have fundamentally different values. So let's just have a beer and do our disagreeing at the ballot box, right?

This line of thinking lets me sleep quite well at night, but it is critically flawed. There are injustices being done and to let them go unchecked is to disregard our civic responsibility. Inaction is a choice, and to choose not to stand up for what's right is worse than cowardly, it's wrong.

I'm of course talking about the misuse of data in political commentary. (really, guy, that's the injustice you're standing up for?)

How many times have you - as a data consumer, advocate, or professional - heard a pundit or correspondent say something regarding "statistics" or "margin of error" that made your skin crawl? Fallacies or misunderstandings are one thing, but even worse, data is often deliberately used to mislead. Examples abound but it is not the point of this article to reproduce them here.

In response to these poisonous transgressions I'd like to offer an antidote. Instead of engaging in a heated debate with a coworker over one too many happy hour pints, buy yourself a six-pack and head home to your computer (we all know the best-waged battles start at a keyboard). Do war with these people and don't let them get away with it. **As experts, we have a duty to protect people from these practices of ignorance or malice.**

If it hasn't become clear yet, my goal with this article is to *inspire* you to do something good with your data and programming skills, specifically in response to what will be arguably one of the most important and public uses of data in recent history: the 2020 US Presidential Election. If punctuating my charge with over-the-top motivational language is what it takes then I'll gladly field the embarrassment of looking cheesy to do so.

It doesn't require a degree in statistics or a public platform like a blog or website in order to serve the public interest (those things help but only one of them is free). It just takes critical thinking, effort, and the desire to send a better-informed electorate to the ballot box in 2020. We have the power to choose, in this not-so-small way, the course of data history. So how do you want that story to go?

To me, politics can be fun and interesting and it's not as hard as you think to do something useful with some open data and a little patience. You don't have to throw a Neural Net at every problem to be valuable (although I'd love to see a NN take on FiveThirtyEight's model).

As data practitioners, political campaigns are our time to shine - where people say things like "statistical significance" on national television! Instead of vilifying those who wield statistics incorrectly or provoking our friends into an argument over minimum wage, let's do something productive with that superiority complex that's all too common of us people "in the know": let's dig into the data and see what we can find out.

It isn't a stretch to say that data, used improperly or maliciously, represents a threat to our democratic institutions. We've seen how people with skills like ours can use it to misinform and manipulate an unwitting population, and until regulation catches up I don't see any way to effectively stop it. But we've also seen how it can be used to save lives and create wellbeing, and I don't see why it can't be used for good in politics too. This is bigger than trying to get your party elected: it's about ensuring that bad actors don't use data to infringe on personal liberties like we've seen time and again, and currently the only way to stop a bad guy with data is a good guy with data.

Of course it is unlikely someone like me or perhaps yourself without a platform or online following will have much impact on the outcome of this election, or the way we as a society leverage the incredible power of data. But I believe it is our civic duty - just like voting - to use our gifts for the protection and advancement of our democratic institutions, however small the contribution.

<hr>

## Appendix: Tools

If you're digging what I've said so far, maybe know a bit of Python, and aren't exactly an expert on politics or analyzing political data (call it politicurious, maybe?), I'd like to turn your attention to two specific things I think can help turn your newfound energy into a productive coding session.

### Free, Open Political Data

There is a wealth of open data on politics if you know where to look. For example, this [fantastic and thorough blog post](https://medium.com/ndp-annotations/civic-and-political-apis-data-sets-and-websites-136fa63a0af1) lists several of them.

I'd also like to mention a couple more (some of which are in the previous article):

* [voteview](https://voteview.com/data) - Congressional voting records and ideological scores for members of Congress
* [OpenSecrets](https://www.opensecrets.org/open-data) - Lots of data on money in politics, like campaign contributions and lobbying efforts
* [FiveThirtyEight](https://data.fivethirtyeight.com/) - Great for polling data, haven't use it for much else but they publish lots of the data behind their awesome analyses

I usually prefer APIs to flat data sets because updating an analysis becomes as easy as rerunning the code (instead of redownloading the dataset first), and that might be especially important when analyzing a time-sensitive event like an election. One might be tempted to create an app that runs the analysis for each user, and if you plan on bringing an interactive experience to a broad audience of non-programmers that is probably your best option. Standing an app on top of a data science analysis is not trivial however, and for most of my analyses I prefer to skip that step and simply use a notebook instead. Which brings me to my next point tool...


### Google Collaboratory

[Google Collaboratory](https://colab.research.google.com/) is a space for you to host and run Jupyter notebooks in the cloud. If you have a Google account (like most of us do) it is free to use and you'll be up and running in seconds. Gone are the days of installing Anaconda, configuring Jupyter, forgetting your password, looking up how to reset the password, installing packages, and having your session die when you accidentally close your laptop. What's especially exciting is that these notebooks are hosted and run in their own cloud-based runtime, and you can even use a GPU backend for training neural nets, for example.

Obviously having some control over your runtime is necessary for many applications, but for the most common (e.g. quick and dirty exploratory analysis, testing a code chunk, doing a coding challenge, etc.) I find it easier to have that abstracted away. Indeed, the easier it is to get up and running the more likely I am to start a new project. Reducing the barrier to entry for data science projects like this might have profound impacts on the global propensity to do good data science. In a less idealistic and more realistic sense, this is a really cool tool I think everybody should have in their toolbox, and when time is of the essence (like it is during an election cycle) it might just be the best tool for the job.

You can also share your work so it can be peer reviewed (feel free to check out [my notebook for an upcoming analysis](https://colab.research.google.com/drive/1sJ0u1JwRWlSUiaww2BMiDCumfnR6YjZt)), and extend each another's work with the click of a button. I understand that this is what GitHub promises, but I have found that while GitHub is good for Data Science workflows, it is not great for quick and dirty analyses that might become irrelevant during the next election cycle. Let's face it: we don't *always* need to spin up a Conda environment, run through the rigamarole of pull requests, and dammit if we didn't forget to pull the master before creating the branch we just spent days on and now there are conflicts.

I know this might get me crucified by the version control evangelists, and it's absolutely possible I'm wrong, but if we as a (Python) data science community have sort of come to a consensus on Jupyter as the almighty IDE then it's high time we started taking full advantage of it by using a platform built specifically for notebooks.
