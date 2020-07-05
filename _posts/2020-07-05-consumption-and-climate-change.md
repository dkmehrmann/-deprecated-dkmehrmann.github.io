---
layout: post
title: Consumption and Climate Change
author: "Andrew Mehrmann"
date: "July 5, 2020"
output: html_document
tags: econ effectivealtruism
---

Climate change is a very real and immediate threat, but I don't think the average person (myself included) easily internalizes just how real and immediate this threat is to our livelihoods and indeed our very existence. Here I outline an argument that consumption is the primary driving force behind climate change, and that the best thing a rich person can do to help mitigate climate change is to reduce their consumption and instead give money to climate change mitigation efforts.

## Climate Change Background

This [excellent paper](https://pubs.aeaweb.org/doi/pdfplus/10.1257/jep.32.4.3) sums up much of the relevant physical science that an economist would like to understand before discussing policy interventions, but I think it serves as a good practical guide for the concerned citizen as well.

To put it extremely simply, we know that Carbon Dioxide (CO2) should induce something called the greenhouse effect, essentially trapping heat from the sun close to the Earth's surface instead of allowing it to escape to space. We also know that human actions over the last few decades, especially since the Industrial Revolution, have been doing things that release a lot of CO2 into the atmosphere. Unless you're extremely thick, it should be obvious that these two things taken together mean that human action should theoretically cause the Earth to warm.

Now, there is some uncertainty as to how much these actions will cause the earth to warm and over what timeframe, because the real story is actually a bit more complicated than the previous paragraph. I direct the inquisitive reader to the paper linked above for more detail. But suffice to say if we keep pumping CO2 into the atmosphere, the Earth is going to get warmer.

For this post I want to ignore the treacherous arena of policy debate and instead focus on the internal debates we have with ourselves about how to best mitigate our own individual carbon footprint. As a premise, I'm supposing you have a personal (perhaps moral) imperative to reduce your marginal impact to the warming of the Earth. Baked in to that is the premise that warming the Earth is bad. Again, I don't really want to focus on that part, but simply wish to put forth a mental model for thinking about our own decisions as they relate to presumed negative impact on the Earth's climate.

## A Microeconomic View

The model of personal behavior should have as its estimand your total personal climate impact. For simplicity, I will substitute CO2 output for climate impact, but it shouldn't matter for the form of the model, only how easy it is to estimate in your head. This CO2 output is sometimes called a "carbon footprint." As an aside, there's a cool calculator [here](https://www.carbonfootprint.com/calculator.aspx). This will constitute the Left Hand Side (LHS) of the equation that is our model.

On the Right Hand Side (RHS), we should place the inputs into your carbon footprint. If we use your total consumption, the efficiency of that consumption (in terms of Kg of CO2 per dollar, for example), we'll get your gross carbon cost. If we then subtract off your gross carbon offsets (things you do that actually reduce carbon in the atmosphere), we should get your Net Carbon Footprint.

$$CF = C \cdot E - F$$

Where $CF$ is your net carbon footprint, $C$ is your total consumption spending, $E$ is your consumption carbon efficiency, and $F$ are all your offsets.

The reason for splitting gross carbon cost into consumption and efficiency is that when people talk about their personal choices as they relate to carbon emissions, they often talk about their efficiency but not their consumption. Put another way, making your consumption 50% more efficient in terms of carbon will have the exact same impact on your carbon footprint as consuming 50% less of everything you already consume.

## A Macroeconomic View

Since the Industrial Revolution, global GDP per capita has risen meteorically. If we equate GDP to consumption (everything produced must be consumed by somebody), we can see a clear relationship between consumption and CO2 levels.

![](/figs/2020-07-05-consumption-climate-change/GDP_CO2.png)

We can also see a clear relationship between consumption/GDP and CO2 output across countries.

<iframe src="https://ourworldindata.org/grapher/co2-emissions-vs-gdp?stackMode=absolute&time=latest" loading="lazy" style="width: 100%; height: 600px; border: 0px none;"></iframe>

To relate this to our mental model $CF = C \cdot E - F$, we can think of GDP as representing $C$, so according to our model, spread across countries at a given level of GDP is due to differences in efficiency or offsetting behaviors.

We also notice that global CO2 efficiency - $E$ in our model - has gotten better recently.

<iframe src="https://ourworldindata.org/grapher/carbon-emission-intensity-of-economies" loading="lazy" style="width: 100%; height: 600px; border: 0px none;"></iframe>

To sum up this macroeconomic view of climate change, we see that there are really two driving forces of how much CO2 an economy generates: the amount of production/consumption, and the efficiency of that production/consumption. Offsetting behaviors are probably included in the efficiency metric shown above, but I've chosen to separate it out for the microeconomic or "mental" model because we have a lot of personal direct control over that figure.

## Summing up the Economics

At the micro level, we get to choose how much to consume or donate to offsetting carbon, and to a certain extent how efficient our consumption is in terms of CO2 per dollar. At the macro level, these decisions and the policies that influence them are reflected as GDP (consumption) and carbon efficiency (consumption efficiency and offsetting). While it is difficult to measure these factors at the micro or individual level, we have made valiant strides to measure them at the macro level. These macro level trends uncover differences in the carbon efficiency of countries, and allow us to monitor how we're doing at mitigating climate change.

## Reduce your Consumption!

Given this model of our individual and collective carbon footprint, what should we do to help mitigate climate change as individuals? I argue that for members of the global rich, reducing consumption is often overlooked as a tool to fight climate change. I also argue there is a moral imperative to do so if you also believe that climate change is bad and that you have a part in causing it.

There is little doubt that standards of living for the global poor increase as they consume more. When their basic needs are not being met, and the value of additional consumption to them may mean the difference between life and death. The utilitarian calculus would suggest that consumption by the global poor has such large positive effects that it may be outweighed by the negative externalities to the climate.

For the global rich - including you, almost certainly - lots of consumption is harder to justify. To bring back our mental model, each dollar of consumption brings a negative externality to the world equivalent to $E$ kilograms of CO2. That might be small or large to you, but I don't think most people think of the dollars they spend this way. To me, that's a problem, because many of these same people also believe that doing the right thing means reducing harm to others. These two things - reluctance to reduce consumption and desire to mitigate climate change - seem logically incompatible.

## Donate to Effective Charities!

What's more, each dollar you don't consume can be used for offsetting. In Econese, the opportunity cost of a dollar not going to offsetting is probably even larger than the direct cost of a consumption dollar. In English, a dollar spent to offset carbon probably offsets a lot more carbon than is put into the atmosphere by a dollar spent on consumption.

For a back-of-the envelope check, based on the graph above a consumption dollar results in 0.35Kg of CO2 emissions. According to an independent analysis, charitable organization Cool Earth [can probably offset about a tonne of CO2 for that same dollar](https://www.givingwhatwecan.org/report/cool-earth/). So the direct cost weighs about as much as a can of soup, and the opportunity cost about as much as a Fiat.

In fact, we can put this more generally by rewriting our mental model as

$$CF = E_{cons} \cdot C - E_{off} \cdot F$$

where $E_{cons}$ is the carbon efficiency of your consumption and $E_{off}$ is the carbon efficiency of your charitable dollars. Then, the opportunity cost outweighs the direct cost when $E_{off} > E_{cons}$. We showed that Cool Earth has an $E_{off}$ of something like 1000 Kg/dollar, and the average $E_{cons}$ in the economy is something like 2.5 Kg/dollar. Even seemingly carbon-intense activities like burning a gallon of gasoline is something like 6 Kg/dollar. Suffice to say that **donating to effective charities can have a huge impact above and beyond reducing consumption or making consumption more carbon efficient.**

## Ethical Consumption

A quick note on so-called Ethical Consumption (e.g. buying from climate-conscious brands). Ethical Consumption is a good step toward self-mitigating climate change, but only if it doesn't lead to an offsetting increase in consumption more broadly. For example, all else equal, buying a new pair of Allbirds (a climate-conscious brand) will have a negative effect on the environment. There are raw materials used, transportation costs, energy expended, etc. to make them. But buying a new pair of Allbirds *may* have a net positive impact on the environment if your alternative was buying from a less climate-conscious brand. Of course it depends on how efficient or inefficient these brands really are in regards to climate impact, but the point is that **ethical consumption is only a net positive if it replaces unethical consumption.**

## Conclusion

Reducing consumption alone is useful, but the question remains what to do with the additional income or productive capacity of the economy. Donating that income to effective charities solves two problems. First, donating  generates positive outcomes for the environment far above and beyond what would be generated by the reduction in consumption alone. Second, donating money is effectively donating economic productivity to certain pursuits. Donating your extra income to pro-environment activities can replace the economic activity lost to the reduction in consumption - which would lead to a reduction in production and therefore jobs - and retool it for a purpose that serves all of humanity.

## Appendix: Code

<script src="https://gist.github.com/dkmehrmann/f1e12d46c37763c6a0e19c1e510fec36.js"></script>
