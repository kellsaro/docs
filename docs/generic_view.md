# Generic Cenit Process

Cenit is an open iPaSS system where, among others functionalities, the most used is to make flows integrations.

The following description shows a basic idea of integration in Cenit.

![integration](https://user-images.githubusercontent.com/30662690/64353019-03c40700-cfcb-11e9-96b2-e4e20ca03c5d.jpg)

In a basic integration where you need send data from a system A to a system B, you should visualize your scenario in the follow way:

You need obtain data to a system A, the data will be saved in Cenit, where you will storage the information needed. Later, the data A, will be mapped to B, and in B you will storage the information needed send to system B.

Before make any process of flows, you should be the API's connection or authorization done in Cenit to have the possibility to make requests.

Also, be defined the [operations/webhooks](gateway.md) neded for each endpoint. 

> See more information about that in: [Gateway Menu/Connections](connection.md) and [Authorizations](authorization.md)

## Flow A

In general: 

- You will obtain the data from A via API.
- The data obtained, will be saved in Cenit the information that you need store or what you need later send to system B.

As the image indicates, this flow will need the creation of the elemets described. 

See more information how create a flow on [Flow Section](flow.md)

## Flow B

In general: 

- It is the process where you will transform or convert the data A to B, follow your needs. For that you will need create a flow with a converter translator, this flow won't need a webhook or operation.

See more information how create a flow on [Flow Section](flow.md)


## Flow C

In general: 

- It is finally where the data saved in Cenit as B, will sent to its system B via API. In tis flow, you should configurate it with a template translator.

See more information how create a flow on [Flow Section](flow.md)


