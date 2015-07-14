---
layout: page
title: Terminology
categories: General
resource: true
description: Terminology
index_order: 1
order: 1
---

#Terminology

##Connections

Connection are the representation of endpoint or integration in Cenit.

##Endpoints

Web applications that can be subscribed to CenitHub.

##Webhooks

The webhook are the final step in a flow, implemented like a request HTTP to an endpoint, for sent or receive data.

##Flows 

Flows define how Data is routed between endpoints and all integrations in order to automate your operations. The relevant Flows will be triggered based on the events that you define for your endpoint.

## Events

Allow that objects flow through the hub.

The creation of new objects and/or changes in existing objects will result in events. These events ultimately result in calls being made to various Flows in your integrations as well as your endpoint.

Events are invisible to your integrations. Your integrations only deal with receiving and returning objects. They are, however, impacted by events since the events are responsible for determining when your integration’s webhooks are called.


##Libraries

Libraries are collections of schemas.

##Schemas

Schemas define data types.

##Data Types

All the Data Type is posible create from a Schema, like JOSN Schema or XSLT (XML Schema), these loads are dynamics using retrospection techniques are possible translate each schema definitions into Ruby Classes on the fly.

It is able to read JSON Schema resources and use them to define Ruby classes in memory.

Also parses JSON conforming to a JSON schema, and instantiates objects corresponding to the JSON Schema classes created.

##Collections

Collection are complete or partially basic block in CenitHub, that can included Connection, ConnectionRole, Flow, Webhooks, Events, Traslators, Libraries, Schemas and Data Types.

##Shared Collections

Starting with CenitHUbyou have the ability to share and manage your collections more effectively. The collections you upload on CenitHub are linked to your account.

The shared collections modal also let's you upload all of your local collections.

You can download individual collections. CenitHub gives you access to collections shared by the CenitHub community

##Integrations

An integration is a collection of services that provide support for connecting your storefront to third-party or in-house applications, like Amazon, Mandrill, Quickbooks, Quiet Logistics and many more.

Each integration is generally provided by a single endpoint application, that is responsible for processing JSON messages that are POST’d to it and relaying the information to the third-party systems.

##Messages

Messages are the core of the Cenit hub. A single action within a storefront can result in several discrete Messages being sent to multiple Endpoints.

##Notifications

Notifications are human readable event logs that can be returned by endpoints as a means of providing a summary of actions taken for a particular order, user, product, etc.

##Schedulers







