---

layout: page
title: Push API
categories: API
resource: true
description: API for full remotly management.
image: /img/docs-api.png
type: parent
version: v2
order: 1
index_order: 2
index_title: API

---

# PUSH API

Allows you to send Data to CenitHub.

There is a single API endpoint for sending push to CenitHub:

https://push.cenithub.com

## PUSHING OBJECTS


###Create an Object

For create a new Order you can do a similar call to that:

```json
{
  "orders": [
    {
      "id": "R154085346",
      "status": "complete",
      "channel": "spree",
      "email": "spree@example.com",
      "currency": "USD",
      "placed_on": "2014-02-03T17:29:15.219Z",
      "totals": {
        "item": 200,
        "adjustment": 20,
        "tax": 10,
        "shipping": 10,
        "payment": 220,
        "order": 220
      },
      "line_items": [
        {
          "product_id": "SPREE-T-SHIRT",
          "name": "Spree T-Shirt",
          "quantity": 2,
          "price": 100
        }
      ],
      "adjustments": [
        {
          "name": "Tax",
          "value": 10
        },
        {
          "name": "Shipping",
          "value": 5
        },
        {
          "name": "Shipping",
          "value": 5
        }
      ],
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
      "billing_address": {
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
      "payments": [
        {
          "number": 63,
          "status": "completed",
          "amount": 220,
          "payment_method": "Credit Card"
        }
      ]
    }
  ]
}
```

A succsess response will send the count of the number of objects received:

```json
{
  "orders": 1
}
```

## Update

For update is possible send only a partial

```json
{
  "orders": 1
}
```

{
  "orders": [
    {
      "id": "R154085346",
      "status": "cancelled"
    }
  ]
}

##Colection of objects

Is possible push a collection of objects in a uniq request

```json
{
  "orders": [
    {
      "id": "R154085346",
      "status": "complete",
      "channel": "spree",
      "email": "spree@example.com",
      "currency": "USD",
      "placed_on": "2014-02-03T17:29:15.219Z",
      "totals": {
        "item": 200,
        "adjustment": 20,
        "tax": 10,
        "shipping": 10,
        "payment": 220,
        "order": 220
      },
      "line_items": [
        {
          "product_id": "SPREE-T-SHIRT",
          "name": "Spree T-Shirt",
          "quantity": 2,
          "price": 100
        }
      ],
      "adjustments": [
        {
          "name": "Tax",
          "value": 10
        },
        {
          "name": "Shipping",
          "value": 5
        },
        {
          "name": "Shipping",
          "value": 5
        }
      ],
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
      "billing_address": {
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
      "payments": [
        {
          "number": 63,
          "status": "completed",
          "amount": 220,
          "payment_method": "Credit Card"
        }
      ]
    },
    {
      "id": "R154085346",
      "status": "complete",
      "channel": "spree",
      "email": "spree@example.com",
      "currency": "USD",
      "placed_on": "2014-02-03T17:29:15.219Z",
      "totals": {
        "item": 200,
        "adjustment": 20,
        "tax": 10,
        "shipping": 10,
        "payment": 220,
        "order": 220
      },
      "line_items": [
        {
          "product_id": "SPREE-T-SHIRT",
          "name": "Spree T-Shirt",
          "quantity": 2,
          "price": 100
        }
      ],
      "adjustments": [
        {
          "name": "Tax",
          "value": 10
        },
        {
          "name": "Shipping",
          "value": 5
        },
        {
          "name": "Shipping",
          "value": 5
        }
      ],
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
      "billing_address": {
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
      "payments": [
        {
          "number": 63,
          "status": "completed",
          "amount": 220,
          "payment_method": "Credit Card"
        }
      ]
    }
  ]
}
```


In this case the response will response:

```json
{
  "orders": 2
}
```

## Collection of diferent objects

Is possible push multiple an different objects in the same request.

```json
{
  "orders": [
    {
      "id": "R154085346",
      "status": "complete",
      "channel": "spree",
      "email": "spree@example.com",
      "currency": "USD",
      "placed_on": "2014-02-03T17:29:15.219Z",
      "totals": {
        "item": 200,
        "adjustment": 20,
        "tax": 10,
        "shipping": 10,
        "payment": 220,
        "order": 220
      },
      "line_items": [
        {
          "product_id": "SPREE-T-SHIRT",
          "name": "Spree T-Shirt",
          "quantity": 2,
          "price": 100
        }
      ],
      "adjustments": [
        {
          "name": "Tax",
          "value": 10
        },
        {
          "name": "Shipping",
          "value": 5
        },
        {
          "name": "Shipping",
          "value": 5
        }
      ],
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
      "billing_address": {
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
      "payments": [
        {
          "number": 63,
          "status": "completed",
          "amount": 220,
          "payment_method": "Credit Card"
        }
      ]
    },
    {
      "id": "R154085346",
      "status": "complete",
      "channel": "spree",
      "email": "spree@example.com",
      "currency": "USD",
      "placed_on": "2014-02-03T17:29:15.219Z",
      "totals": {
        "item": 200,
        "adjustment": 20,
        "tax": 10,
        "shipping": 10,
        "payment": 220,
        "order": 220
      },
      "line_items": [
        {
          "product_id": "SPREE-T-SHIRT",
          "name": "Spree T-Shirt",
          "quantity": 2,
          "price": 100
        }
      ],
      "adjustments": [
        {
          "name": "Tax",
          "value": 10
        },
        {
          "name": "Shipping",
          "value": 5
        },
        {
          "name": "Shipping",
          "value": 5
        }
      ],
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
      "billing_address": {
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
      "payments": [
        {
          "number": 63,
          "status": "completed",
          "amount": 220,
          "payment_method": "Credit Card"
        }
      ]
    }
  ],
  "products": [
    {
      "id": "SPREE-T-SHIRT",
      "name": "Spree T-Shirt",
      "sku": "SPREE-T-SHIRT",
      "description": "Awesome Spree T-Shirt",
      "price": 35,
      "cost_price": 22.33,
      "available_on": "2014-01-29T14:01:28.000Z",
      "permalink": "spree-tshirt",
      "meta_description": null,
      "meta_keywords": null,
      "shipping_category": "Default",
      "taxons": [
        [
          "Categories",
          "Clothes",
          "T-Shirts"
        ],
        [
          "Brands",
          "Spree"
        ],
        [
          "Brands",
          "Open Source"
        ]
      ],
      "options": [
        "color",
        "size"
      ],
      "properties": {
        "material": "cotton",
        "fit": "smart fit"
      },
      "images": [
        {
          "url": "http://dummyimage.com/600x400/000/fff.jpg&text=Spree T-Shirt",
          "position": 1,
          "title": "Spree T-Shirt - Grey Small",
          "type": "thumbnail",
          "dimensions": {
            "height": 220,
            "width": 100
          }
        }
      ],
      "variants": [
        {
          "sku": "SPREE-T-SHIRT-S",
          "price": 39.99,
          "cost_price": 22.33,
          "quantity": 1,
          "options": {
            "color": "GREY",
            "size": "S"
          },
          "images": [
            {
              "url": "http://dummyimage.com/600x400/000/fff.jpg&text=Spree T-Shirt Grey Small",
              "position": 1,
              "title": "Spree T-Shirt - Grey Small",
              "type": "thumbnail",
              "dimensions": {
                "height": 220,
                "width": 100
              }
            }
          ]
        }
      ]
    },
    {
      "id": "SPREE-T-SHIRT",
      "name": "Spree T-Shirt",
      "sku": "SPREE-T-SHIRT",
      "description": "Awesome Spree T-Shirt",
      "price": 35,
      "cost_price": 22.33,
      "available_on": "2014-01-29T14:01:28.000Z",
      "permalink": "spree-tshirt",
      "meta_description": null,
      "meta_keywords": null,
      "shipping_category": "Default",
      "taxons": [
        [
          "Categories",
          "Clothes",
          "T-Shirts"
        ],
        [
          "Brands",
          "Spree"
        ],
        [
          "Brands",
          "Open Source"
        ]
      ],
      "options": [
        "color",
        "size"
      ],
      "properties": {
        "material": "cotton",
        "fit": "smart fit"
      },
      "images": [
        {
          "url": "http://dummyimage.com/600x400/000/fff.jpg&text=Spree T-Shirt",
          "position": 1,
          "title": "Spree T-Shirt - Grey Small",
          "type": "thumbnail",
          "dimensions": {
            "height": 220,
            "width": 100
          }
        }
      ],
      "variants": [
        {
          "sku": "SPREE-T-SHIRT-S",
          "price": 39.99,
          "cost_price": 22.33,
          "quantity": 1,
          "options": {
            "color": "GREY",
            "size": "S"
          },
          "images": [
            {
              "url": "http://dummyimage.com/600x400/000/fff.jpg&text=Spree T-Shirt Grey Small",
              "position": 1,
              "title": "Spree T-Shirt - Grey Small",
              "type": "thumbnail",
              "dimensions": {
                "height": 220,
                "width": 100
              }
            }
          ]
        }
      ]
    }
  ]
}
```


The response will include the number of each type of object received.

```json
{
  "orders": 2,
  "products": 2
}
```

##Custom attributes for Objects

```json
{
  "orders": 2,
  "products": 2
}
```

##AUTHENTICATION

###HEADERS

In order to securely push Data to Wombat you will need to include the following values as part of the request header:

| Name                    | Description               |
| :-----------------------| :-------------------------|
| **X-Hub-Store	The**      | The identifier for the store you are pushing to.
| **X-Hub-Access-Token**  | The secure access token associated with your store.

###Command line example


The following example shows how you can include the headers when posting from the command line.

```
$ curl -i -X POST -H 'X-Hub-Store: YOUR_STORE_ID' \ -H
    'X-Hub-Access-Token: YOUR_ACCESS_TOKEN' -d'{ "shipments":[ { "id":
    "1111111111", "order_id": "R1111111111", "email": "spree@example.com",
    "cost": 5.0, "status": "ready", "stock_location": "default",
    "shipping_method": "UPS Ground (USD)", "tracking": "", "updated_at": null,
    "shipped_at": "2014-02-03T17:33:55.343Z", "shipping_address": {
    "firstname": "Joe", "lastname": "Smith", "address1": "1234 Awesome Street",
    "address2": "", "zipcode": "90210", "city": "Hollywood", "state":
    "California", "country": "US", "phone": "0000000000" }, "items": [ {
    "name": "Spree T-Shirt", "product_id": "SPREE-T-SHIRT", "quantity": 1,
    "price": 30.0, "options": { } } ] } ] }' https://push.cenithub.com 
```