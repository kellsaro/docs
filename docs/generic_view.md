# Generic Cenit Process

Cenit is an open iPaaS system where, among others functionalities, the most used is to make flows integrations.

The following description shows a basic idea of a Cenit integration.

![integration_five](https://user-images.githubusercontent.com/30662690/64360139-d03ba980-cfd7-11e9-9ddd-3ad6c7af744f.jpg)

In a basic integration where you need send data from a system A to a system B, you should visualize your scenario in the follow way:

You need obtain data from a system A, the data will be saved in Cenit, where you will storage the needed information. Later this information will be mapped in process B, where you will storage the information to be sent to system B.

For implementing that integration in Cenit, each Process defined, is usually traduced in Cenit as a flow.

Before starting any process or flow, you must have configured the API's connection or authorization in Cenit. This way you have the possibility to make requests.

Also, the [operations/webhooks](gateway.md) needed for each endpoint must be defined. 

> See more information about that in: [Gateway Menu/Connections](connection.md) and [Authorizations](authorization.md)



## Process A/Import Flow

In general: 

- You will obtain the data from system A via an API.
- The the data obtained will be saved in Cenit for processing it and send it later to system B.

As the image indicates, this flow will need the creation of the elemets described. 

See more information how create a flow on [Flow Section](flow.md)

## Process B/Converter Flow

In general: 

- This is the process where you will transform or convert the data stored previously, depending on your needs. For that you will need create a flow with a converter translator. This flow won't need a webhook or operation.

See more information how create a flow on [Flow Section](flow.md)


## Process C

In general: 

-  This is finally where the converted/translated data is sent to system B via an API. In tis flow, you should configurate it with a template translator.

See more information how create a flow on [Flow Section](flow.md)


