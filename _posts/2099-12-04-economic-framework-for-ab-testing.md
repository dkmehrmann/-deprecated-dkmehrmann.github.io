---
layout: post
title: An Economic Framework for A/B Testing
author: "Andrew Mehrmann"
date: "December 02, 2099"
output: html_document
tags: programeval
---

---

This post is Part Three of a three-part series on Randomized Controlled Trials (RCTs) with an emphasis on A/B testing. Other articles in this series are []() and []().

---

It's easy to get on the A/B testing hype train, but the benefits are actually a bit more nuanced than they might seem. "Knowing what works" seems like a good idea, and indeed almost always is. Unfortunately, A/B testing only really tells us what works if

A/B testing is not without costs however, and is not appropriate for every application. For example, there is an opportunity cost to delaying good ideas from reaching 100% implementation, as well as rejecting good ideas that fail to meet (arbitrary) significance criteria. We can start to think of an economic framework to understand how best to leverage testing in different scenarios. Namely, we can define a matrix as follows to help identify which type of testing is appropriate:

![](/figs/2019-11-25-ab-tests-make-sense/ab-table.png)
