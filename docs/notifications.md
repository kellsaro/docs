# Notifications

The notification function could be call by task or Tenant object. 

`task.notify(message: "Something")`

`Tenant.notify(message: "Something")`

> The `task.notify` way is used in the environment where the variable "task" is alive. These environments are in translators or in algortihms where the var "task" be a parameter.

> The `Tenant.notify` way could be used in all Cenit elements (translators and algorithms)

By default the notifications are error notifications:

![notification_error](https://user-images.githubusercontent.com/30662690/63546640-403a3200-c4f8-11e9-9041-379de4c8dbf4.png)

Optionally, you can define the type of notification:

- Notice

`Tenant.notify(message: "Something", type: "notice")`

![notification_notice](https://user-images.githubusercontent.com/30662690/63546744-82fc0a00-c4f8-11e9-9e14-90dfecb75af1.png)

- Warning

`Tenant.notify(message: "Something", type: "warning")`

![notification_warning](https://user-images.githubusercontent.com/30662690/63546825-b0e14e80-c4f8-11e9-9269-4d3cfd117eaa.png)

## How get an attachment in a notification

If you want trigger a notification with a file, you can do this:

`Tenant.notify({ message: "message", attachment: attachment })
`

Where attachment is the file:

```
attachment = {
    filename: 'backtrace.txt',
    contentType: 'plain/text',
    body: "this is the message"
  }
```