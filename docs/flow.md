# Flow

Flows define how Data is routed between endpoints and all integrations in order to automate your operations. The relevant Flows will be triggered based on the events that you define for your endpoint.

In a integration generally you must have the need to create three kinds of integration that will depends of the translation kind that you select in the configuration flow. Depending on the translator or the flow kind, Cenit will require you the data to fill in the flow form. The flow types are:
  1. Parser/Import: It refers to Get petitions. The flow will do a Get request and the data will be obtained in the parser translator.
  2. Converter: There may be flows that do not have an associated endpoint in its operation or don't request any petition outside Cenit, it refers to a transformation between two data in Cenit internally, in which we will perform a set of actions based on information that already we have stored in Cenit.
  3. Export/Translator: It refers to a flow where the data is transform in a translator wich result is export while a POST/UPDATE/DELETE petition to a API.

>For more detail of how to do a basic integration go to [Basic Cenit Integrations Section](markdown.md) 
## Add New

For creating a flow you must have in mind what events, translators, algorithms, and data will be related in a petition while a webhook/resource.
Create a translator, involves 3 fundamental steps in the wizard form: “Select the translator”, “Select the webhook” and “Save and done”.

>For view the generic elements in a form go to [Generic Form Actions Section](generic-action_form.md)

![Create Flow](https://user-images.githubusercontent.com/30662690/63459028-d9e2e000-c421-11e9-82c8-1ebfb5f2c61e.png)

The flow form is extensive, there are some specifications of the fields to fill out. The others fields as Webhook, Authorization and Connection role, are selection items, if doesn’t exist, you can create them. They appear if are necessary depending on the flow kind.

  • Event: 
   Here, you should put the event which you want work. If you select or create one of “Data Event” type, in the form will appear a new field: Source scope, and the field Source data type, will become as mandatory. It isn’t if the event is a Scheduler.  

  • Translator(Required): 
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
    It defines a parser translator where you can handle the data response after a export(POST?UPDATE/DELETE) petition.

>All algorithms involve in a flow should have as parameter the variable: task. For more information go to: [Algorithm kinds](algorithms.md)