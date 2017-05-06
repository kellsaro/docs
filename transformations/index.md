---
layout: page
title: Introduction
categories: Transformations
resource: true
description: Persistent objects and files
icon: fa-random
type: parent
index_order: 10
index_title: Transformations
order: 1
---

## Transformation

 Every flow have a Transformation that performs the main data processing.

 Depending on the Transformation type a flow can:

   * Pull (import) data into Cenit

   * Export data outside Cenit

   * Update/Convert data inside Cenit

 A flow must define a data type unless its Transformation defines one.

   ![Transformation]({{site.baseurl}}/img/flow/flow.png)

## Scope

 If a flow is not of type import then it must define a scope for data processing.

 The scope can be defined depending on the flow event, Transformation data type or the flow custom data type:

  * Event source process only the record who fire the event
  * All records scope process all the records
  * Filter scope process the records following some criteria.

  ![Scope]({{site.baseurl}}/img/flow/scope.png)

## Update/convert

  When the flow Transformation is of type update/convert no further configuration is needed beyond the scope.

  The active option prevent the flow processing even if its event is fired when it is not checked.

  ![Update/convert]({{site.baseurl}}/img/flow/update-convert.png)

## Export/Import

  When the flow Transformation is of type:

   * Import, then the data will be pulled into Cenit
   * Export, then the data will be send outside Cenit

  In any case an end-point is needed to pull or send the data.

  An end-point is determined by a connection and a webhook

  ![Export/Import]({{site.baseurl}}/img/flow/imp-exp.png)


## Export Flows

If the flow Transformation is of type export it is possible to process the request response with a response Transformation.

Response Transformations are of type import and may require a response data type if they do not define one.

Response Transformations may create other records which may fire new event that trigger other flow processing…

 ![Export Flows]({{site.baseurl}}/img/flow/export.png)
