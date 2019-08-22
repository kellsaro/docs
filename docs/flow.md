# Flow

Flows define how Data is routed between endpoints and all integrations in order to automate your operations. The relevant Flows will be triggered based on the events that you define for your endpoint.

In a integration generally you must have the need to create three kinds of integration that will depends of the translation kind that you select in the configuration flow. Depending on the translator or the flow kind, Cenit will require you the data to fill in the flow form. The flow types are:
  1. Parser/Import: It refers to GET petitions. The flow will do a Get request and the data will be obtained in the parser translator.
  2. Converter: There may be flows that do not have an associated endpoint in its operation or don't request any petition outside Cenit, it refers to a transformation between two data in Cenit internally, in which we will perform a set of actions based on information that already we have stored in Cenit.
  3. Export/Translator: It refers to a flow where the data is transform in a translator wich result is export while a POST/UPDATE/DELETE petition to a API.

>For more detail of how to do a basic integration go to [Basic Cenit Integrations Section](markdown.md) 
## Add New

For creating a flow you must have in mind what events, translators, algorithms, and data will be related in a petition while a webhook/resource.
Create a translator, involves 3 fundamental steps in the wizard form: “Select the translator”, “Select the webhook” and “Save and done”.

> For view the generic elements in a form go to [Generic Form Actions Section](generic-action_form.md)

![Create Flow](https://user-images.githubusercontent.com/30662690/63459028-d9e2e000-c421-11e9-82c8-1ebfb5f2c61e.png)

The flow form is extensive, there are some specifications of the fields to fill out. The others fields as Webhook, Authorization and Connection role, are selection items, if doesn’t exist, you can create them. They appear if are necessary depending on the flow kind.

  • Event: 
   Here, you should put the event which you want work. If you select or create one of “Data Event” type, in the form will appear a new field: Source scope, and the field Source data type, will become as mandatory. It isn’t if the event is a Scheduler.  

  • Translator: 
    Select or create the Transformation (Parser, Converter or Template). In the case of converters, only you need fill 2 steps to create the flows, the regards with webhook doesn’t fill.

  • Before submit: 
    Is the algorithm that you want to be executed before the translator of the flow is executed. It’s listed in the algorithms list.

  • Discard events: 
    It’s a check input, if checked, the events won't be triggered.

  • Active:
    It’s a check input, it if isn’t checked, the flow will not active when the events or executions from the code call it. Another form of active or deactivate a flow, is through the list, with the Active Icon.
           
  • Auto retry:
    This is a selection Item, its values are: manually or automatic.

  • Notify request:
    This option, if is checked, allows that the flow notification of request flow will be stored in System notification list.
    
  • Notify response:
    This option, if is checked, allows that the flow notification of response flow will be stored in System notification list.

  • After process callbacks:
    Algorithms executed after flow processing, execution state is supplied as argument

  • Response Translator:
    It defines a parser translator where you can handle the data response after a export(POST/UPDATE/DELETE) petition.

> All algorithms involve in a flow structure should have as parameter the variable: task. For more information go to: [Algorithm Section](algorithms.md)

## Flow tasks

A flow execution will always triggers a task. You can see the task associated to it in:

- http://cenit.io/execution
- http://cenit.io/flow_execution
- http://system_notification

> You can see more information about tasks in: Task Section

## How process a flow?

Always a flow will be executed if the flow is "Active". On the contrary, the task will be executed with a warning, and the Flow content won't be processed.

A flow can be executed by:
- Process action.
- Data Event.
- Shceduler Flow.
- Code. 

### Process action

![Process action](https://user-images.githubusercontent.com/30662690/63529314-79f84200-c4d2-11e9-9821-b55dcc7eed54.png)

This execution triggers a task.

![flow_execution_notification](https://user-images.githubusercontent.com/30662690/63531246-1f60e500-c4d6-11e9-8a89-290e75a48a7c.png)

To see the task status go to the link refered above, and you will see the task details.

![flow_execution1](https://user-images.githubusercontent.com/30662690/63531575-cd6c8f00-c4d6-11e9-9696-4428aefc922c.png)

> To see more detail about the task properties go to: Task Section

### Data Event

A flow could be executed when the Event related in it be true. The way to link a Data event in a flow is trhough Add new flow form.

![create_flow_event](https://user-images.githubusercontent.com/30662690/63533177-44575700-c4da-11e9-8247-cd809d35eef5.png)

### Shceduler Flow

You can scheduler a flow for two ways:

#### 1. Defined an scheduler in the Event field in it creation.

![create_flow_event](https://user-images.githubusercontent.com/30662690/63533177-44575700-c4da-11e9-8247-cd809d35eef5.png)

#### 2. Linked the flow task to a scheduler.

If you want you flow be executed in a periodic time, after processed a flow, you can go to the task related with this and shceduler it.

![scheduler_task](https://user-images.githubusercontent.com/30662690/63531933-9cd92500-c4d7-11e9-9cc6-8d2fb9546f42.png)

Also, you can go to the Show action of the Task, and go to the Action menu, and go to the Scheduler option.

![scheduler_task](https://user-images.githubusercontent.com/30662690/63532319-6bad2480-c4d8-11e9-81aa-61200b0046dd.png)

> If you have in doubt how create a scheduler go to [Scheduler section](scheduler.md)

#### Code

Sometimes you need to execute a flow in determined moment in an algorithm or translator code.

- Execution of a flow.

  `task = Cenit.namespace('Lazada').flow('Create Product').process(flow_data).task`

  task: is the task execution object. 

- Queuing an execution of a flow behind another task execution.

  `task = Cenit.namespace('Lazada').flow('Create Product').join_process(flow_data, join_task).task`

  join_task: task executed previously.

- Parameters to pass into flow_data:

  `flow_data = {
    connection: Cenit.namespace('Lazada').connection('Conection'), 
    object_ids: [record.id],
    template_parameters: { channel: channel_name, ecommerce_id: target_record.ecommerce_id },
  }`

  connection: this parameter is set if you want to change the connection with what the flow will be executed.

  object_ids: Cenit record id that defines the object that will be sent the flow in its execution.

  template_parameters: It defines template_parameters of webhooks, connections, or internal parameters that will be interpreted inside the translator of the flow.

> If you want to know how define via code some Cenit elements go to [Cenit elements in code](elemts_code.md)

