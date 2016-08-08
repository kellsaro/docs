---
layout: page
title: Schedulers
categories: Workflows
resource: true
description: Description of Schedulers
index_order: 1
order: 1
---

# Schedulers

We at [Cenit IO](https://cenit.io) have been working on improving user experience and as a result we've got a new interface for schedulers configuration. You can check it out at [https://cenit.io/setup~scheduler/new](https://cenit.io/setup~scheduler/new).


![Data Definitions]({{site.baseurl}}/img/workflows/new_scheduler.png)


Schedulers now have out-of-the-box defaults for every day executions, you'd simply need to set the name and namespace and you'd be good to go.

If you don't want your schedule to start immediately after activation, you can set a specific date for it 

![Data Definitions]({{site.baseurl}}/img/workflows/01_start_at.png)

and you'll be provided with a date picker in order to facilitate the selection.

![Data Definitions]({{site.baseurl}}/img/workflows/02_start_at_picker.png)

When it comes to schedulers you might want a one-time execution, or maybe a specific periodicity, but you could also want to ensure that your tasks get executed on appointed dates, so we provide all this scenarios only a few clicks away.

![Data Definitions]({{site.baseurl}}/img/workflows/03_repeat_every.png)

For periodical executions choose the 'Every...' option, enter a number in the input box and select the time span.

![Data Definitions]({{site.baseurl}}/img/workflows/04_repeat.png)

Otherwise, for apointed dates choose the 'Select manually'. The first thing for manual schedulling would be to specify the time of day you would want the scheduler to be triggered

![Data Definitions]({{site.baseurl}}/img/workflows/05_repeat_at_picker.png)

and then decide if you want a week-based approach or a month-based approach:

![Data Definitions]({{site.baseurl}}/img/workflows/06_repeat_weekly.png)

Week-based: Note selected weekdays and months on the year, this setting would have the scheduler trigger on the Last Sunday of June and December.


![Data Definitions]({{site.baseurl}}/img/workflows/07_repeat_monthly.png)

Month-based: this setting would have the scheduler trigger on the 14th and Last day of Jun and December.

It would be good to notice that for any specific setting on the manual approach, selecting no item is the same as selecting all of them. That is, if you want your scheduler to be triggered everyday of the month in June, check only the month June and leave all days unchecked. You could off course check each individual day by yourself, but it is an unnecesary trouble. This rule applies to Week-based approach as well.

Finally, you can schedule an end for your task, so that it doesn't get queued for execution passed some date, it is very much like the starting date setting.


![Data Definitions]({{site.baseurl}}/img/workflows/08_end_at_picker.png)

And that's all folks! Stay tuned for more posts like this! If you have a suggestion or complain you can pop it here, or you can start an issue on our Github repo.

