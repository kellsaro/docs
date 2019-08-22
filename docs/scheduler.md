# Schedulers

Schedulers are events triggered on a certain moment and can be optionally recurrent. You can access to it via Workflow/Scheduler Menu, and there you must view the list of them.

## Add New

![create_scheduler](https://user-images.githubusercontent.com/30662690/63461909-aa36d680-c427-11e9-88ea-72f87fdb9a59.png)

This is the form to create a scheduler. These are the options can be specified for the moment the scheduler would be triggered for the first time, and how it should be rescheduled and finally when should it stop. All this options default to a 'Start on activation, run every day' setting.

- Start section.
  If the scheduler shouldn't start immediately after activation, a date can be specified for it. A date picker facilitates the selection.

- Repeat section.
  Schedulers can be a one-time execution, or a specific periodicity, but can also be triggered on appointed dates.
  For periodical executions choose the 'Every...' option, enter a number in the input box and select the time span.
  Otherwise, for appointed dates choose the 'Select manually'. The first thing for manual scheduling would be to specify the time of day the scheduler should be triggered at, and then decide on a week-based approach or a month-based approach.

- End section
  Finally, the task can be scheduled to end, so that it doesn't get queued for execution passed some date, it is very much like the starting date set.

## Activate scheduler

For activate a scheduler, you must go to "Activate/Deactivate" action.

![scheduler_actions](https://user-images.githubusercontent.com/30662690/63527451-20dadf00-c4cf-11e9-8d68-95e82a7b6cb3.png)

The schedulers Activated are observing when the condition are true to execute the tasks linked to them.

## Associate scheduler to a task

You can associate schedulers to a flow or to an algorithm task.

### Flow task:

If you want you flow be executed in a periodic time you should first process the flow:

![Process action](https://user-images.githubusercontent.com/30662690/63529314-79f84200-c4d2-11e9-9821-b55dcc7eed54.png)

This execution triggers a task.

![flow_execution_notification](https://user-images.githubusercontent.com/30662690/63531246-1f60e500-c4d6-11e9-8a89-290e75a48a7c.png)

To see the task status go to the link refered above, and you will see the task details.

![flow_execution1](https://user-images.githubusercontent.com/30662690/63531575-cd6c8f00-c4d6-11e9-9696-4428aefc922c.png)

After the process a flow, you can go to the task related with this and shceduler it.

![scheduler_task](https://user-images.githubusercontent.com/30662690/63531933-9cd92500-c4d7-11e9-9cc6-8d2fb9546f42.png)

Also, you can go to the Show action of the Task, and go to the Action menu, and go to the Scheduler option.

![scheduler_task](https://user-images.githubusercontent.com/30662690/63532319-6bad2480-c4d8-11e9-81aa-61200b0046dd.png)


### Algorithm task:

If you want the execution of the algorith be scheduler you must first run the algorithm:

![run_algorithm](https://user-images.githubusercontent.com/30662690/63537430-b8e2c380-c4e3-11e9-9996-f36a51dc7c9a.png)

And select the option run as backgroud.

![run_as_background](https://user-images.githubusercontent.com/30662690/63537813-a61cbe80-c4e4-11e9-9813-9e77d5f26d72.png)

Select the task triggered by the algorithm execution.

![algorithm_execution](https://user-images.githubusercontent.com/30662690/63538036-11669080-c4e5-11e9-9e50-45c754a1a374.png)

Associate the task to the scheduler.

![scheduler_task](https://user-images.githubusercontent.com/30662690/63531933-9cd92500-c4d7-11e9-9cc6-8d2fb9546f42.png)



