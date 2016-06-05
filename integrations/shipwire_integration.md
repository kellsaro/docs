---
title: Shipwire Endpoint
layout: page
description:
categories: Integrations
resource: true
order: 12
---

![Data Definitions]({{site.baseurl}}/img/integrations/shipwire.png)

## Overview

[Shipwire](http://www.shipwire.com/) is an eCommerce warehousing and order fulfillment company. Its outsourced fulfillment service includes software for managing inventory across warehouses.


###ShipWire API

Use the Shipwire API to deliver a world-class e-commerce experience customized to your business needs. The technology lets you create flows which are both tightly integrated and highly automated.


With the Shipwire API you can:

* Create custom cart connections.
* Integrate Shipwire services into your ERP or checkout system.
* Connect Shipwire with shopping carts or marketplace.

###-API Documentation

The API Documentation can be found here: **https://www.shipwire.com/w/developers/**

###Prerequisites

Shipwire API authenticates clients using HTTP (Basic) access authentication, username and password.
First, you will need an active Shipwire account. If you don’t have one, you can get started with a free 30-day trial at *https://app.shipwire.com/sign-up*.

###Pull Collection

 * **User:** User, example lan.octavio83@,gmail.com

 * **Pass:** Pass, example 296c217452064f51


### List of features that offers CenitHub with Shipwire.

 Orders

 * List Orders
 * Create Order
 * Get Order
 * Cancel Order
 * Update Order

 Products

 * List Products
 * Create Product
 * Update Product
 * Get Product

 Receiving

 * List Receiving
 * Create Receiving
 * Update Receiving
 * Get Receiving
 * Cancel Receiving
 * List Tracking of Receiving
 * List Label of Receiving
 * List Shipments of Receiving
 * List Items of Receiving
 * List Instructions of Receiving

 Return

 * List Return
 * Create Return
 * Get Return

 Stock

 * List Stock


###Configuration

####Schema for Order

 CenitHub has a pre-defined Order Schema:

     ```json
    {
      "title": "Order",
      "type": "object",
      "properties": {
        "orderId" : {
          "title":"Ordern Id",
         "type": "integer"
        },
        "orderNo": {
          "title":"Orden No",
          "type": "string"
        },
        "externalId": {
          "title":"External Id",
          "type": "string"
        },

       "processAfterDate": {
          "title": "Process after Date",
          "type": "string"
        },

      "commerceName": {
        "title": "Commerce Name",
        "type": "string"
      },
      "status":{
        "type":"string"
      },
      "lastUpdatedDate": {
         "title": "Last update date",
       "type": "string"
      },
      "transactionId": {
        "type": "string"
      },
      "needsReview": {
        "type": "integer"
      },
      "items": {
        "type": "array",
        "items": {
          "$ref": "order_items.json"
        }
      },
      "holds": {
        "type": "array",
        "items": {
          "$ref": "order_holds.json"
        }
      },
      "returns": {
        "type": "array",
        "items": {
          "$ref": "return.json"
        }
      },
      "options": {
        "$ref": "options.json"
      },
       "shipFrom": {
         "title": "Ship From",
        "$ref": "shipfrom.json"
      },
      "shipTo": {
        "title": "Ship To",
        "$ref": "recipient_details.json"
      },
      "commercialInvoice": {
        "$ref": "commercialInvoice.json"
      },
      "packingList":{
        "title": "Packing list",
        "$ref": "packingList.json"
      },

      "shippingLabel": {
        "title": "Shipping label",
        "type": "string"
      },
      "routing": {
       "$ref" : "order_routing.json"
      },
      "events": {
        "$ref" : "order_event.json"

      },
      "pricing": {
       "$ref" : "order_pricing.json"
      },
      "shipwireAnywhere": {

        "$ref" : "order_shipwireAnywhere.json"
      },
        "pricingEstimate": {
          "title": "Estimate",
        "$ref" : "order_pricing.json"
      }

      }
    }

  ```

  Sample Json Order:

      ```
    {
      "orderNo": "12345",
      "externalId": "r44",
      "processAfterDate": "2015-08-30T16:30:00-07:00",
      "commerceName": "The Best Commerce",
      "items": [
          {
              "sku": "Mouse",
              "quantity": 1,
          },
          {
              "sku": "Pianos",
              "quantity": 1,
          }
      ],
      "options": {
          // The warehouse to ship from - 'null' means Shipwire should pick the optimal warehouse for me (default, recommended)
          "warehouseId": null,
          // Next Day shipping service
          "serviceLevelCode": "1D",
          ...
      },
      "shipFrom": {"company": "CENITHUB."},
      "shipTo": {
          "email": "support@cenitsaas.com),
          "name": "Octavio",
          "address1": "6501 Railroad Avenue SE",
          "address2": "Room 315",
          "address3": "",
          "city": "Snoqualmie",
          "state": "WA",
          "postalCode": "98065",
          "country": "US",
          "phone": "4258882556",
          "isCommercial": 0,
          "isPoBox": 0
      },
      // Message to include in packages
      "packingList": {
          "note": "This must be where pies go when they die. Enjoy!"
      }
    }

  ```

## Flow samples

### 1.Create Order

  Create Order in Shipwire from Cenit.

#### Webhook

![Webhook for Create Order]({{site.baseurl}}/img/integrations/shipwire/createOrder.png)


#### Translator

![Translator for Create Order]({{site.baseurl}}/img/integrations/shipwire/export_model.png)


#### Flow

![Flow for Create Order]({{site.baseurl}}/img/integrations/shipwire/flow_createOrder.png)


### 2.List Orders

  Get an itemized list of orders.

#### Webhook


![Webhook for List Orders]({{site.baseurl}}/img/integrations/shipwire/listOrder.png)


#### Translator


![Translator for List Orders]({{site.baseurl}}/img/integrations/shipwire/import_list.png)


#### Flow

![Flow for List Orders]({{site.baseurl}}/img/integrations/shipwire/flow_listOrder.png)


### 3.List Stocks

Get stock information for your products.

#### Webhook


![Webhook for Get Stock]({{site.baseurl}}/img/integrations/shipwire/getStock.png)


#### Translator


![Translator for List Stock]({{site.baseurl}}/img/integrations/shipwire/import_stock_list.png)

#### Flow


![Flow for List Stock]({{site.baseurl}}/img/integrations/shipwire/listStock.png)


