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

Schedulers are events triggered on a certain moment and can be optionally recurrent.

![Scheduler defaults]({{site.baseurl}}/img/workflows/new_scheduler.png)

Options can be specified for the moment the scheduler would be triggered for the first time, if and how it should 
be rescheduled and finally when should it stop. All this options default to a 'Start on activation, run every day' 
setting.

If the scheduler shouldn't start immediately after activation, a date can be specified for it.

![Start at options]({{site.baseurl}}/img/workflows/01_start_at.png)

A date picker facilitates the selection.

![Start at date]({{site.baseurl}}/img/workflows/02_start_at_picker.png)

Schedulers can be a one-time execution, or a specific periodicity, but can also be triggered on appointed dates.

![Repeat every ...]({{site.baseurl}}/img/workflows/03_repeat_every.png)

For periodical executions choose the 'Every...' option, enter a number in the input box and select the time span.

![Repeat options]({{site.baseurl}}/img/workflows/04_repeat.png)

Otherwise, for appointed dates choose the 'Select manually'. The first thing for manual scheduling would be to 
specify the time of day the scheduler should be triggered at

![Repeat time picking]({{site.baseurl}}/img/workflows/05_repeat_at_picker.png)

and then decide on a week-based approach or a month-based approach:

![Repeat weekly]({{site.baseurl}}/img/workflows/06_repeat_weekly.png)

Week-based: Note selected weekdays and months on the year, this setting would have the scheduler trigger on the 
Last Sunday of June and December.


![Repeat monthly]({{site.baseurl}}/img/workflows/07_repeat_monthly.png)

Month-based: this setting would have the scheduler trigger on the 14th and Last day of June and December.

It would be good to notice that for any specific setting on the manual approach, selecting no item is the same as 
selecting all of them. That is, if a scheduler is to be triggered everyday of the month in June, check only the 
month June and leave all days unchecked. You could off course check each individual day by yourself, but it is an 
unnecessary trouble. This rule applies to Week-based approach as well.

Finally, task can be scheduled to end, so that it doesn't get queued for execution passed some date, it is very 
much like the starting date setting.

![End at picker]({{site.baseurl}}/img/workflows/08_end_at_picker.png)

