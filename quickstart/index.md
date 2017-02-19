---
layout: page
title: Introduction
categories: Quickstart
resource: true
description: Quickstart guide
icon: fa-wpbeginner
type: parent
index_order: 2
index_title: Quickstart
order: 2
---

# Terminology

## Connections

Connection are the representation of endpoint or integration in Cenit.

## Webhooks

The webhook are the final step in a flow, implemented like a request HTTP to an endpoint, for sent or receive data.

Define an HTTP Method and params.

## Flows

Flows define how Data is routed between endpoints and all integrations in order to automate your operations. The relevant Flows will be triggered based on the events that you define for your endpoint.

A flow defines how data is processed by the execution of one or more actions, if the data is coming in to Cenit or going out of Cenit. Data processing involve:

₋ An execution trigger to start the data processing

₋ Data types

₋ Translators

₋ Connections & Webhooks

## Data Events

Allow that objects flow through the hub.

The creation of new objects and/or changes in existing objects will result in events. These events ultimately result in calls being made to various Flows in your integrations as well as your endpoint.

Events are invisible to your integrations. Your integrations only deal with receiving and returning objects. They are, however, impacted by events since the events are responsible for determining when your integration’s webhooks are called.

## Schedulers

Schedulers are events triggered on a certain moment and can be optionally recurrent.

## Schemas

Schemas define data types.

## Object Types

All the Data Type is possible create from a Schema, like JOSN Schema or XSLT (XML Schema), these loads are dynamics using retrospection techniques are possible translate each schema definitions into Ruby Classes on the fly.

It is able to read JSON Schema resources and use them to define Ruby classes in memory.

Also parses JSON conforming to a JSON schema, and instantiates objects corresponding to the JSON Schema classes created.

## Collections

Collection are complete or partially basic block in Cenit, that can included Connection, ConnectionRole, Flow, Webhooks, Events, Traslators, Libraries, Schemas and Data Types.

## Shared Collections

Starting with Cenit you have the ability to share and manage your collections more effectively. The collections you upload on Cenit are linked to your account.

The shared collections modal also let's you upload all of your local collections.

You can download individual collections. Cenit gives you access to collections shared by the Cenit community


## Notifications

Notifications are human readable event logs that can be returned by endpoints as a means of providing a summary of actions taken for a particular order, user, product, etc.
