---
layout: page
title: Introduction
categories: Workflows
resource: true
description: Flow, Data Events & Schedulers.
icon: fa-cogs
index_order: 3
order: 1
---


# Flow

A flow defines how data is processed by the execution of one or more actions.

Data processing involve:

 * An execution trigger to start the data processing.
 * Data types.
 * Translators.
 * Connections & Webhooks, if the data is coming in to Cenit or going out of Cenit.

## Execution triggers

Flows processing can be manually invoked or through the occurrence of events.

![Data Definitions]({{site.baseurl}}/img/flow/trigger.png)

Events are of two types:

 * **Observers:** listen for properties changes on records.

 * **Schedulers:** they occurs periodically.
 
 ![Observer]({{site.baseurl}}/img/flow/observer.png)
 
 ![Scheduler]({{site.baseurl}}/img/flow/scheduler.png)

## Translator 
 
 Every flow have a translator that performs the main data processing.
    
 Depending on the translator type a flow can:
    
   * Pull (import) data into Cenit
   
   * Export data outside Cenit
   
   * Update/Convert data inside Cenit
    
 A flow must define a data type unless its translator defines one.
  
   ![Translator]({{site.baseurl}}/img/flow/flow.png)
   
## Scope
 
 If a flow is not of type import then it must define a scope for data processing.
 
 The scope can be defined depending on the flow event, translator data type or the flow custom data type:
 
  * Event source process only the record who fire the event
  * All records scope process all the records
  * Filter scope process the records following some criteria.
  
  ![Scope]({{site.baseurl}}/img/flow/scope.png) 

## Update/convert
  
  When the flow translator is of type update/convert no further configuration is needed beyond the scope.
  
  The active option prevent the flow processing even if its event is fired when it is not checked.
  
  ![Update/convert]({{site.baseurl}}/img/flow/update-convert.png) 
  
## Export/Import
  
  When the flow translator is of type:
  
   * Import, then the data will be pulled into Cenit
   * Export, then the data will be send outside Cenit
  
  In any case an end-point is needed to pull or send the data.
  
  An end-point is determined by a connection and a webhook
  
  ![Export/Import]({{site.baseurl}}/img/flow/imp-exp.png) 
  
## Connections

A connection consist in an URL and a set of parameters, headers and template parameters.

The connection URL, parameters and headers can be described by using Liquid Templates.

The template parameters and its values are available in the Liquid Templates as local variables so URL and its components can be computed dynamically.

### Connection example: Twilio API

The URL to connect with the Twilio API have the following form:

https://api.twilio.com/2010-04-01/Accounts/{account_sid}

and the following headers should be provided:

 * Accept-Charset: utf-8
 * Accept: application/json
 * Authorization: Basic {basic auth string}

where **{basic auth string}** is the base 64 format of the user Account SID and the Account token

A better approach is to use template parameters and Liquid Templates:

https://api.twilio.com/2010-04-01/Accounts/{account_sid}

 * Accept-Charset: utf-8
 * Accept: application/json
 * Authorization: Basic base64 ({account_sid}:{auth_token})

Defining the template parameters account_sid and auth_token Cenit computes dynamically the connection URL and its headers.

### Webhooks example: Twilio API

The Twilio connection is just the base URL for the actions of the Twilio API, and these way is how occurs almost in every API.

It is possible the same URL to indicate different actions depending on the HTTP method, for example

https://api.twilio.com/2010-04-01/Accounts/{account_sid}/Messages.json

send messages using the POST method but retrieve messages when using GET.

All those actions are defined as Webhooks.

So a webhook is basically a path that completes the connection URL, and HTTP method and can define also a set of headers, parameters and template parameters.

The webhook path of the Twilio API will be:

 * Messages.json by GET list the messages.

 * Messages.json by POST send a message.

 * Messages/{{id}}.json by GET retrieve a message with a SID.
 
 Since the webhook defines the action the flow will submit to the end-point then the webhook is primary over connection.
 
 It is possible to submit the same action to several end-points, so the connections are not specified directly but through a connection role.

  ![Flow Webhook]({{site.baseurl}}/img/flow/webhook.png)
  
### Connection Roles

A connection role is a relation between a set of connections and a set of webhooks indicating that every webhook in the set can be applied to every connection also in the set:

 ![Connection Roles]({{site.baseurl}}/img/flow/conn_rol.png)
 
If the connection role is not defined then Cenit look for any connection from which it is possible to reach the webhook through a connection role.

If the connection role is supplied the Cenit only look for the associated connections to the connection role.

## Export Flows

If the flow translator is of type export it is possible to process the request response with a response translator.

Response translators are of type import and may require a response data type if they do not define one.

Response translators may create other records which may fire new event that trigger other flow processing…

 ![Export Flows]({{site.baseurl}}/img/flow/export.png)




