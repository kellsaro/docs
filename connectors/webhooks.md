---
layout: page
title: Webhooks
categories: Connectors
resource: true
description: Description Webhooks
index_order: 1
order: 1
---

#Webhooks

The webhook are the final step in a flow, implemented like a request HTTP to an endpoint, for sent or receive data.

Define an HTTP Method and params.

Webhooks are simple HTTP requests that contain JSON or XML formatted data relating to an event on Cenit.

Every Webhook include some common fields along with the specific object data for the event, these fields are:

Name	Description
request_id
parameters
object	The object key can be any object within CenitHub (i.e. order, product, user, cart, etc)

| Name                    | Description               |
| :-----------------------| :-------------------------|
| **request_id**          | This is a unique identifier for the request, and must be present in the response to indicate a successful result.
| **parameters**          | An array of Parameters.
| **object**              | The object key can be any object within CenitHub (i.e. order, product, user, cart, etc).

##Authentication

Each Webhook call contains two HTTP headers to identify the specific store that the Webhook is referencing and a token to verify that the Webhook is coming from CenitHub, and not some other third party.

Name	Description
	A unique identifier for the store that the Webhook is intended for.
X-Hub-Token	A secret key to identify the source of the Webhook as CenitHub.
This key is unique per integration or storefront.

| Name                    | Description               |
| :-----------------------| :-------------------------|
| **X-Hub-Stored**        | A unique identifier for the store that the Webhook is intended for.
| **X-Hub-Token**         | A secret key to identify the source of the Webhook as CenitHub.

It’s important to ensure that all Webhook calls are made over HTTPS, as these calls include sensitive information that, if intercepted, could cause potential security breaches.

###Parameters

Integrations are intended to be simple stateless applications, and so store-specific information (like credentials) are passed as part of each Webhook POST.

This allows each Integration to support multiple customers at once, and supports high availability by not requiring any persistence within the integration itself.

The Parameters value within the Webhook body is a simple object with multiple key values, for example:

###Sample

```json
{
  "request_id": "52f367367575e449c3000001",
  "parameters": {
    "mandrill.api_key": "abc",
    "mandrill.api_token": "123"
  },
  "order": {}
}
```

Custom parameters can be configured when registering a Webhook using the CenitHub client application.

API implementations of a Webhook must always send an acknowledgement with the original request_id back to CenitHub as part of the response.

Summary information returned to CenitHub will be used to create notifications that are presented to storefront admin staff in the CenitHub client application.

##Response

###Success

If the Webhook has been completed successfully, it should return a 200 response code along with the request_id that is provided by CenitHub.

SAMPLE SUCCESSFUL WEBHOOK RESPONSE

```json
{
  "request_id": "52f367367575e449c3000001",
  "summary": "Successfully updated inventory for ROR-7890123"
}
```

Webhooks can also return objects that will be persisted to CenitHub. An example
of this can be seen in the get_shipments storefront Webhook. This returns new shipments from the storefront.

SAMPLE SUCCESSFUL WEBHOOK RESPONSE INCLUDING RETURNED OBJECTS

```json
{
  "request_id": "52f367367575e449c3000001",
  "shipments": [
    {
      "id": "12836",
      "order_id": "R154085346",
      "email": "spree@example.com",
      "cost": 5,
      "status": "ready",
      "stock_location": "default",
      "shipping_method": "UPS Ground (USD)",
      "tracking": "12345678",
      "shipped_at": "2014-02-03T17:33:55.343Z",
      "shipping_address": {
        "firstname": "Joe",
        "lastname": "Smith",
        "address1": "1234 Awesome Street",
        "address2": "",
        "zipcode": "90210",
        "city": "Hollywood",
        "state": "California",
        "country": "US",
        "phone": "0000000000"
      },
      "items": [
        {
          "name": "Spree T-Shirt",
          "product_id": "SPREE-T-SHIRT",
          "quantity": 1,
          "price": 30,
          "options": {}
        }
      ]
    }
  ]
}
```

Objects returned by a Webhook must be returned in an array.
FAILURE

If the Webhook was not successfully completed it should return a 500 response code along with the request_id that is provided by CenitHub. This will ensure that CenitHub knows that this specific Webhook was unsuccessful and that it should possibly be retried in the future (if appropriate).

SAMPLE WEBHOOK FAILURE RESPONSE

```json
{
  "request_id": "52f367367575e449c3000001",
  "summary": "Cannot update inventory. Product ROR-7890123 not found in storefront."
}
```

Make sure to return a 500 response code so that CenitHub knows the request was not successful.
