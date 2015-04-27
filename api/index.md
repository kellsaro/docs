---

layout: page
title: V1
categories: API
resource: true
description: API for full remotly management.
image: /img/docs-api.png
type: parent
version: v2
order: 1
index_order: 3
index_title: API

---

# CenitHub API.v1

## Routes

In Rails, a resourceful route provides a mapping between HTTP verbs and URLs to controller actions. 

With the next `rake task` you could visualize the diffents routes for CenitHub api:

```bash
rake routes
```

| Prefix Verb             | URI Pattern                      | Controller#Action
| :-----------------------| :--------------------------------|:--------------------
| api_v1_push POST        | api/v1/push(.:format)            | api/v1/api#push
| api_v1 GET              | /api/v1/:model(.:format)         | api/v1/api#index 
| GET                     | /api/v1/:model/:id(.:format)     | api/v1/api#index 
| DELETE                  | /api/v1/:model/:id(.:format)     | api/v1/api#destroy


##Authentication

###Headers 

In order to securely you will need to include the following values as part of the request header:

| Name                    | Description               |
| :-----------------------| :-------------------------|
| **X-Hub-Store**         | The identifier for the store you are pushing to.
| **X-Hub-Access-Token**  | The secure access token associated with your store.

Is possible use user credentials too:

| Name                    | Description               |
| :-----------------------| :-------------------------|
| **'X-User-Access-Key**  | The identifier for the user account.
| **X-User-Access-Token** | The secure access token associated with your user account.



###Command line example

The following example shows how you can include the headers when posting from the command line.

```
$ curl --data @./objects.json -i -X POST \
    -H 'X-Hub-Store: YOUR_STORE_ID' \ 
    -H 'X-Hub-Access-Token: YOUR_ACCESS_TOKEN' \
    -H 'Content-type:application/json' 
    http://www.cenithub.com/api/v1/push
```
or

```
$ curl --data @./objects.json -i -X POST \
    -H 'X-User-Access-Key: YOUR_USER_KEY' \ 
    -H 'X-User-Access-Token: YOUR_USER_ACCESS_TOKEN' \
    -H 'Content-type:application/json' 
    http://www.cenithub.com/api/v1/push
```

## Pushing Objects

Allows you to send Data to CenitHub. 

Is possible use for:
* setup models: connection, connection_role, flow, etc.
* data models: any data model loaded dinamiclyv: orders, products, emails, etc.

```
https://cenithub.com/api/v1/push
```

### Create an Object

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

Now an example with setup models

```json
{
  "connection_role": {
    "name": "con_role_062",
    "webhooks": [
        {
          "name": "web_032",
          "path": "algo"
        }
     ],
     "connections": [{
       "name": "con_184",
       "url": "aasas"
     }]
   }
}
```

### Update

For update is possible send only a partial

{
  "orders": [
    {
      "id": "R154085346",
      "status": "cancelled"
    }
  ]
}

### Colection of objects

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

### Collection of diferent objects

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

With setup moedels

```json
{
 "connection": [
    {
      "name": "con_182",
      "url": "localhost:3000"
    },
    {
      "name": "con_183",
      "url": "localhost:3000"
    }
  ],
  
  "connection_role": {
    "name": "con_role_062",
    "webhooks": [
        {
          "name": "web_032",
          "path": "algo"
        }
     ],
     "connections": [{
       "name": "con_184",
       "url": "aasas"
     }]
   }
}
```

## Show

```bash
curl -i -X GET \
  -H 'X-User-Access-Key: N196371715' \
  -H 'X-User-Access-Token: sAgxA1kviRKnMA3eFx5_' \
  http://www.cenithub.com/api/v1/connections/553995c06d69677e50000000
```

## Index

```bash
curl -i -X GET \
  -H 'X-User-Access-Key: N196371715' \
  -H 'X-User-Access-Token: sAgxA1kviRKnMA3eFx5_' \ 
  http://www.cenithub.com/api/v1/connections
```

## Delete

```bash
curl -i -X DELETE \
  -H 'X-User-Access-Key: N196371715' \
  -H 'X-User-Access-Token: sAgxA1kviRKnMA3eFx5_' \    
  http://www.cenithub.com/api/v1/connections/553995c06d69677e50000000
```
