# Algorithms

Algorithms are pieces of logic that you can choose to execute and chain in order to process data. They will be found into Compute/Algorithm Menu.

## Algorithm's attributes

### Algorithm's Name

Algorithm names must be valid method names and this must start with a letter and not contain white spaces or any special characters.

### Algorithm's Parameter

Algorithms can have many parameters, each with their own individual fields.

#### Parameter's name

The name of paranmeters besides the logical function of allowing you to recognize it on the administration interface, is also used as the name of the variable holding its value in the Algorithm’s code, so it must be a valid variable name.

In case of the algortihm be the type:

- before_submit: should have as required parameters the variables "options" and "task" in this order.
- after_calback: should have as required parameter the variable "task".


#### Parameter's type

You can leave a parameter untyped, which means it will accept any value passed on to it, or you can set a type for it in order to easily validate that the code receives what it expects.

Currently available types include:

- integer for integer numbers.
- number for floating point precision numbers.
- boolean for boolean true or false values.
- string for strings of characters.
- hash for dictionary-like objects holding a set of key: value pairs. Best to represent complex objects.

#### Parameter's Many attr    

If checked the parameter will be treated as an array rather than a singular object.

#### Parameter's Required attr   

If unchecked a default value must be provided.

#### Parameter's Default attr   

Only available if the parameter is not required, this value will be used when no value is specified on execution.

It is important to note that all required parameters must be declared before the optional ones.

### Algorithm's Code

The actual code of the algorithm, must be written in Ruby, parameters can be accessed by their names.

The code of an algortihm is located into snippets. See more of this on: [Snippet section](snippets.md)

### Algorithm's Store Output

If checked Cenit will attempt to store the output of the algorithm on a DataType record (or records if the output is an array).

- Output DataType

    Only available if Store Output is checked. If left blank a new FileDataType will be created. When storing output on file data type records, the mime type of the file will be guessed from the output.

- Validate Output

    Only available if an Output DataType is selected for the output storage. This will prevent chaining further algorithm executions in the output cannot be validated against the chosen data type, otherwise, it will fail silently and allow any chaining to carry on.

## Algorithm Excecution ways

An algorithm can be executed in these ways:

- Run Algorithm option.
- Task algorithm scheduled.
- Via code.
- Before_submit field of a flow.
- After_callback of a flow.
- As an application action.


### Run Algorithm

You can execute an algorith by a run option.

![run_algorithm](https://user-images.githubusercontent.com/30662690/63537430-b8e2c380-c4e3-11e9-9996-f36a51dc7c9a.png)

Then you should enter the parameters for the execution, and if you want run as background.

![run_as_background](https://user-images.githubusercontent.com/30662690/63537813-a61cbe80-c4e4-11e9-9813-9e77d5f26d72.png)

> Run as background implies that the execution will trigger as background in a queque tasks.

### Task algorithm scheduled

When you ran the algorithm, you can associate the task to a scheduler created.

Select the task triggered by the algorithm execution.

![algorithm_execution](https://user-images.githubusercontent.com/30662690/63538036-11669080-c4e5-11e9-9e50-45c754a1a374.png)

Associate the task to the scheduler.

![scheduler_task](https://user-images.githubusercontent.com/30662690/63531933-9cd92500-c4d7-11e9-9cc6-8d2fb9546f42.png)

> If you want to know how create an scheduler, go to [Scheduler Section](scheduler.md)

### Via code

Sometimes you will need execute algorithms inside another algorithms or translators.

The way to call an algorithm inside a code is:

`Cenit.namespace('Lazada').algorithm('create_image_url').run()`

If the alrotihm has parameters, execute it with this way:

`Cenit.namespace('Lazada').algorithm('create_image_url').run([parameters])`

- parameters: hash of algorithm parameters.

> If you call an algorithm inside a translator or algorithm with the same namespace, you only can call it with the name:
`create_image_url()` or `create_image_url([parameters])`

### Before_submit field of a flow

This algorithm that you want to be executed before the translator of the flow is executed. It’s listed in the algorithms list. This algorithm must have the parameters: options and task, in this order. See more information on: [Add New flow](https://cenit-io.github.io/docs/#/flow?id=add-new)

### After_callback of a flow

Algorithms executed after flow processing, execution state is supplied as argument with the "task" parameter. See more information on: [Add New flow](https://cenit-io.github.io/docs/#/flow?id=add-new)

### Application's action.

This is the algorithm that the application will execute when its path is consulted. What this algorithm returned will be rendered to the application URL path. This algorithm must have as parameters: control and params. See more information about applications on: [Applications](application.md)

## Algorithm notifications

Inside the algorithm code, you can write some notification points.

This is the way:

`Tenant.notify(message: "Something")`

If you want to know the differents types of notifications, go to [Notifications Section](notifications.md)