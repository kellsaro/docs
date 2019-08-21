# Data Events

The events define when a flow or a task could be executed depending if the condition linked to a data type is true. You can access them through the main workflows menu.

- Menu: `WorkFlows/Data Events`
- Sub Menus: 
  - `Observer`
  - `Schedulers`

##Observer

It is an event will be ovserving when the record condition is true to executed the flow linked to it.

<!-- Image create observer -->

• DataType: It is the object in which the event condition will be applied.
• Trigger evaluator: If your event is conditioned by a processing, you have the possibility to program it through an algorithm.
• Triggers: It is where you can add the differents triggers conditions for your observer. The triggers are conditioned by an specific attribute of the datatype.

Some evaluations for the triggers are:
    • Is present: It’s used when the record already exists. For example, if we use “Is present” with create_at, the event will trigger when a new record already exists. If it is used in an update_at, the event will trigger when an update of an existing record is made.
    • Is blank: The event will be launched when the record exists and is blank.
    • Change: The event will be trigger when the record has some change. It may be that it is created from the beginning, or that it already exists.
    • Present and Change: The event will be trigger when the record exists and change any value. It depends of the conditions created.

##Schedulers

It is an event conditioned by the time period.
