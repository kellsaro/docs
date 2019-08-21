## Schedulers

Schedulers are events triggered on a certain moment and can be optionally recurrent.

![create_scheduler](https://user-images.githubusercontent.com/30662690/63461909-aa36d680-c427-11e9-88ea-72f87fdb9a59.png)

Options can be specified for the moment the scheduler would be triggered for the first time, if and how it should be rescheduled and finally when should it stop. All this options default to a 'Start on activation, run every day' setting.

- Start section.
  If the scheduler shouldn't start immediately after activation, a date can be specified for it. A date picker facilitates the selection.

- Repeat section.
  Schedulers can be a one-time execution, or a specific periodicity, but can also be triggered on appointed dates.
  For periodical executions choose the 'Every...' option, enter a number in the input box and select the time span.
  Otherwise, for appointed dates choose the 'Select manually'. The first thing for manual scheduling would be to specify the time of day the scheduler should be triggered at, and then decide on a week-based approach or a month-based approach.

- End section
  Finally, the task can be scheduled to end, so that it doesn't get queued for execution passed some date, it is very much like the starting date set.
