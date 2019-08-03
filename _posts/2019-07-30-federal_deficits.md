---
layout: post
title: "The National Debt and its Derivatives"
author: "Andrew Mehrmann"
date: "August 3, 2019"
output: html_document
categories: election ds
---

*The [notebook for this analysis](https://colab.research.google.com/drive/14zIpFh00cR6n8BaOB-JxIFd3DRrpFeGZ) is available via Collaboratory. You can also create a copy or [run it yourself](https://stackoverflow.com/questions/52011084/what-is-playground-mode-in-googles-colaboratory)*.

<hr>

I saw a Tweet (via Reddit) recently that caught my eye:

<br>

<center>
<blockquote class="twitter-tweet" data-lang="en">
<p lang="en" dir="ltr">
Reagan took the deficit from 70 billion to 175 billion.
Bush 41 took it to 300 billion.
Clinton got it to zero.
Bush 43 took it from 0 to 1.2 trillion.
Obama halved it to 600 billion.
Trump’s got it back to a trillion.

Morons: “Democrats cause deficits.”</p>&mdash; Alex Cole (@acnewsitics) <a href="https://twitter.com/acnewsitics/status/1153694545986621442?ref_src=twsrc%5Etfw">July 23, 2019</a></blockquote>
</center>

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br>

This astounded me. I fact checked him and...he’s right! [For the most part, anyway.](https://www.politifact.com/truth-o-meter/statements/2019/jul/29/tweets/republican-presidents-democrats-contribute-deficit/) This got me thinking: Is it possible that there exists *clear evidence* of partisan effects on the Federal Budget Deficit? If true, this would certainly influence how we understand claims from the left and right about the budgetary policies of those across the aisle. Also, is *change in deficit* really the "right way" to think about debt and budgetary issues?

Before we begin, I want to be clear that I'm not attacking this Tweet or it's author. On the contrary, I find their assertion intriguing enough to warrant further exploration, and I hope you'll believe me when I say that I have no political motive for doing so. What I want to know are the facts, not the talking points, as I believe truth will lead us to salvation. Of course it's nearly impossible for one's own bias not to creep in, so I invite you to dig into the data yourself and let me know what you find.

I'll start by briefly covering deficits and their relationship to the National Debt.

## Debt and its Derivatives

A debt, national or otherwise, accumulates as a result of a budget deficit. There are [other ways to add to the debt](https://www.thebalance.com/deficit-by-president-what-budget-deficits-hide-3306151) too, but for the purposes of this article we can safely ignore them. The Federal Budget consists of income from taxes and expenditures on things like defense and Social Security. If you spend more on these programs than you take in from taxes, you'll run a budget deficit, and thereby add to the debt. Let's take a quick look at where the government makes and spends its money.

<p align="center">
  <img src="https://www.mercatus.org/sites/default/files/sourcesoffederal1.jpg">
</p>


<p align="center">
  <img src=" https://www.mercatus.org/sites/default/files/federalspending1.jpg">
</p>

I’m not an expert on the nuanced costs and benefits of a government holding debt, but rather would like to start from the premise that a government consistently running over budget and accruing debt without paying it off is not sustainable. If you don't believe me, it should be at least a little concerning that the Federal Government has set up [a website where you can donate to help pay down the national debt](https://www.pay.gov/public/form/start/23779454/).

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/debt.png">
</p>

Not only is our debt increasing, but the rate at which it is increasing is increasing. This means that the deficit must be increasing year over year. In mathematical terms, you can think of the deficit as the *first derivative* of the debt, and the year over year change in deficit (Δ Deficit) as the *second derivative* of the debt.

If you're not into math jargon, just understand that debt is the accumulation of deficits, and deficits are the accumulation of changes in the deficit. Mouse over the columns Deficit and Δ Deficit to see how this works - **the yellow cells of a lower order metric add to the green cell.**

<style type="text/css">

.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-e76x{background-color:#fe996b;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
.tg .tg-4nbr{background-color:#ffcc67;border-color:#ffcc67;text-align:left;vertical-align:top}
th { white-space:pre }
</style>

<center>
<table class="tg" style="undefined;table-layout: fixed; width: 350px">
<colgroup>
<col style="width: 75px">
<col style="width: 78px">
<col style="width: 82px">
<col style="width: 115px">
</colgroup>
  <tr>
    <th class="tg-0lax">Year</th>
    <th class="tg-0lax">Δ Deficit
(2nd Der)</th>
    <th class="tg-0lax">Deficit
(1st Der)</th>
    <th class="tg-0lax">Debt (EOY)</th>
  </tr>
  <tr>
    <td class="tg">1</td>
    <td class="tg-0lax">0</td>
    <td class="tg-0lax">0</td>
    <td class="tg">0</td>
  </tr>
  <tr>
    <td class="tg">2</td>
    <td class="tg-0lax">-50</td>
    <td class="tg-0lax">-50</td>
    <td class="tg">-50</td>
  </tr>
  <tr>
    <td class="tg">3</td>
    <td class="tg-0lax">-50</td>
    <td class="tg-0lax">-100</td>
    <td class="tg">-150</td>
  </tr>
  <tr>
    <td class="tg">4</td>
    <td class="tg-0lax">+150</td>
    <td class="tg-0lax">+50</td>
    <td class="tg">-100</td>
  </tr>
</table>
</center>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
    $('.tg-0lax').on('mouseover', function() {      
        var row = $(this).parent().parent().children().index($(this).parent());
        var col = $(this).parent().children().index($(this));

        var i;
        for (i = 0; i < row+1; i++) {
          $(this).parent().parent().find('tr').eq(i).find('td').eq(col).css("background-color", "yellow");
        }
        $(this).parent().parent().find('tr').eq(row).find('td').eq(col+1).css("background-color", "green");
    });
    $('.tg-0lax').on('mouseout', function() {
      var row = $(this).parent().parent().children().index($(this).parent());
      var col = $(this).parent().children().index($(this));
      var i;
      for (i = 0; i < row+1; i++) {
        $(this).parent().parent().find('tr').eq(i).find('td').eq(col).css("background-color", "");
      }
      $(this).parent().parent().find('tr').eq(row).find('td').eq(col+1).css("background-color", "");
    });
});
</script>


## Who can we Blame

What we all really want to know is *who can we blame all this debt on?* In the Tweet above, the author attributes reducing the deficit to Democratic presidents. Or rather, refutes the claim that Democrats *cause* the deficit. But how much can one administration or Congress really change these things, and **how much of the issue is inherited from previous years?** Debt is by definition inherited from administration to administration, but are deficits? Are changes in deficit?

Additionally, it's not just the President that influences the budget: that's technically Congress's job. This gives way to the point of this analysis: **to understand partisan effects on a federal budget, you need to include House and Senate control, and we need to look at debt and its first and second derivatives.** In what follows, I dig into these topics using data on the federal budget/debt and party control of the House, Senate, and Presidency over the last 50 years (see the [appendix](#appendix-the-data) for details).

## Digging into the Data

Before we start, I want to point out that it is not *just* party affiliation that controls how much deficit we run or debt we accumulate; it’s also economic conditions, warfare, etc., so it’s important to note that whatever these numbers say does not indicate a causal relationship between party and debt/deficit.

Note that all figures are adjusted for inflation using 1983 dollars.

### Debt

We can start by taking a look at the National Debt against who was in control of each body of government for the given Fiscal Year.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/debt_by_house.png">
</p>

Red and Blue indicate Republican and Democrat, respectively, keeping with convention. White bars indicate "split years", or years when power was being handed from one party to another. Note that fiscal years don't exactly line up with election cycles, hence the existence of these split years.

Almost every year since 1970 has seen the National Debt increase. Such a monotonic pattern doesn't really tell us a good story, and claims that "X President increased the debt" are sort of missing the point, because *almost every president in recent history has increased the debt.* We know from above that increasing the debt is a result of running a budget deficit, so let's take a look at those figures directly.

### Deficit

Recall that a deficit results from government spending more than it takes in. Each fiscal year Congress decides on a new budget, and at the end of that fiscal year we can see how well we adhered to it and how much of a deficit or surplus we ran.

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/deficit_by_house.png" width="600px">
</p>

On the left we're looking at deficit by fiscal year, so a high value means we added a lot to the debt and a low value means we added a little or subtracted from the debt. A flat line would mean we’re adding (or subtracting) the same amount to (or from) the debt every year. An increasing trend means we’re *adding to the debt at an increasing rate*, and decreasing the opposite.

On the right, I've plotted the distribution (specifically a [kernel estimate](https://en.wikipedia.org/wiki/Kernel_density_estimation) of it) of yearly deficits for Republicans and Democrats, ignoring split years. A distribution shifted to the right would indicated higher deficits for that respective party, while a wider distribution would indicate more variance in the size of the yearly deficit for that party.

Right away in the left plot we see the deficit caused by the 08’-09’ financial crisis and subsequent stimulus package. Another thing to note is that the famous "Bill Clinton got the deficit to zero” thing happened with a largely Republican House/Senate. Notice also how the line isn’t very “jagged,” meaning that the deficit in one period might be dependent at least in part on the deficit in the previous period. Indeed, using a metric called [autocorrelation](https://en.wikipedia.org/wiki/Autocorrelation) I find that that **the deficit in one year is positively correlated with the deficit in the previous year.** I've included plots [in an appendix below](#appendix-autocorrelation).

This means that in addition to debt being inherited year-over-year (this is true by definition), **deficits are also inherited year-over-year**. For example, if we run a huge deficit in 2020, it’s likely that there will be a large deficit in 2021 as well. Intuitively, the policies of your predecessors still have the be paid for regardless of if you like them or not, so they will be included in your budget (unless you repeal them which is usually tough). I didn't look directly at split years where power was changing hands (e.g. do Republican presidents inherit Democratic deficits or vice versa) because there just isn't much data, but that would be a good area of future exploration.

### Δ Deficit

Finally, I did the same analysis for the second derivative of the national debt: the change in budget deficit year over year, or Δ Deficit. The reason this is important again is that both debt and deficits can be inherited, so statistics regarding how much debt or deficit a president or Congress ran will certainly be influenced by the previous administration. So what we're asking here is *how much did each administration change the deficit*. This gets closer to the heart of what we're asking: are Democrats or Republicans running up the bills that can't be paid?

<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/change_deficit_by_house.png" width="600px">
</p>

So we’re getting out of the realm of interpretability here as we go deeper into the differentials, but a flat line would mean that the amount we’re increasing or decreasing the deficit year-over-year is the same. That’s about what we see, with it centered just above zero, meaning we’re sort of running a steadily increasing deficit with a few fluctuations here and there.

The plot on the right is the important one at the heart of this argument. We do see a slight separation for the presidency, which reflects the spirit of the above Tweet, but there is no such separation for the House and Senate. Furthermore, the distributions overlap by quite a bit, meaning that the evidence is not as clear as it may seem by just counting which Presidents reduced the deficit and which increased it.

Unfortunately, **there doesn't appear to be a clear difference between Democrats and Republicans on Δ Deficit.** I say unfortunately because if you read this far you were probably hoping for something you could use against your political rivals in the future. No such luck.

For completeness, I also checked the autocorrelation between yearly changes in deficit and they indeed turn out to be uncorrelated, meaning **Δ Deficits are probably not inherited over time.** Just because you increased the deficit last year doesn't mean you'll increase it this year and vice versa. So while changes in deficit are certainly dependent on lots of things, they’re apparently not dependent on how much you increased or decreased the deficit last year.

## Conclusions

I’ve shown that **budget deficits are inherited year-over-year** so attributions of blame for debt accumulation should be at least partially based on the second-order figure *change in deficit (Δ Deficit)* as opposed to debt accumulated or deficit registered. Indeed, the Tweet above uses this metric to point out that Democratic presidents have tended to reduce deficits while Republican presidents have tended to increase them.

While this trend with recent presidents certainly makes for interesting banter, it should not be used to attribute blame for debt accumulation. The President's and Congress’s relationship to deficit through the federal budget is nuanced and attributing any causation would require a similarly sophisticated analysis. Nonetheless my observational analysis shows **no clear evidence that control over the presidency or either house of congress by either major political party has any correlation with the accumulation of national debt.**

I concede that it is hard to square facts like laid out in the Tweet above with my relatively lengthy and technical argument; it is far easier to reference things that are simple to explain and support your case. I also concede that (using more gentle language than the author) there is no evidence that Democrats cause deficits, either. I want to be clear that I'm not attacking the Tweet's assertion, but rather adding in the details around it so readers can formulate more informed opinions regarding debt, deficits, and partisan allegiance.

## Appendix: The Data

I really really didn’t want to compile my own data to do this analysis, and luckily I found [Stephen Bloch’s webpage](http://goliards.us/adelphi/deficits/index.html) where he had done so already. He also has some similar analyses there, so I consider my work an extension of his. Obviously then my data is not from a primary source, but he was very transparent about [his methods and assumptions](http://goliards.us/adelphi/deficits/procedures.html) so for what it's worth I trust its accuracy.

I use only the last 50 years of data because party platforms change over time and it doesn’t make much sense to group 1920s Republicans together with the current GOP. 50 was chosen because it was nice and round, and I have not looked into whether or not the results shown here are stable with other choices of “lookback” time. The notebook is linked above, so I invite you to try it out!

On that note: while I was running through early iterations of this analysis I emailed Stephen some preliminary findings and, to my surprise, he emailed back! He asked (as he does on his page) about if there might be a relationship between both houses of Congress and possibly the presidency being held by the same party (which would mean lots of legislation could get passed) and the deficit. I have yet to perform that analysis, and I’ll join him in asking somebody to help us with it.

## Appendix: Autocorrelation

### Autocorrelation for Deficit
<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/ac_deficit.png">
</p>

### Autocorrelation for Δ Deficit
<p align="center">
  <img src="/figs/2019-07-30-federal_deficits/ac_change_deficit.png">
</p>
