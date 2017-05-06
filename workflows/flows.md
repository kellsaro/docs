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

Flows define how Data is routed between endpoints and all integrations in order to automate your operations. The relevant Flows will be triggered based on the events that you define for your endpoint.

A flow defines how data is processed by the execution of one or more actions, if the data is coming in to Cenit or going out of Cenit. Data processing involve:

₋ An execution trigger to start the data processing

₋ Data types

₋ Translators

₋ Connections & Webhooks


## Execution triggers

Flows processing can be manually invoked or through the occurrence of events.

![Data Definitions]({{site.baseurl}}/img/flow/trigger.png)

Events are of two types:

 * **Observers:** listen for properties changes on records.

 * **Schedulers:** they occurs periodically.

 ![Observer]({{site.baseurl}}/img/flow/observer.png)

 ![Scheduler]({{site.baseurl}}/img/flow/scheduler.png)
